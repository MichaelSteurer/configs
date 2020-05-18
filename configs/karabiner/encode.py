import json
import re
import os
import sys


def main(input_folder, output_folder):
    input_files = [f for f in os.listdir(input_folder) if ".json" in f]
    for input_file in input_files:
        print(f"Input File: {input_file}")
        lines = []
        with open(f"{input_folder}/{input_file}", "r") as file:
            lines = file.readlines()

        json_lines = "".join([line for line in lines if not line.lstrip().startswith("//")])
        result = process(json.loads(json_lines))

        output_file = f"{output_folder}/{input_file}"
        with open(output_file, "w") as file:
            file.write(result)


def process(input_json):
    form = json.dumps(input_json, indent=4, cls=KarabinerEncoder)
    form = re.sub(r"},\s*{\s*\n", r"}, {\n", form)  # remove new line between '},' and '{'
    return form


class KarabinerEncoder(json.JSONEncoder):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.indentation_level = 0

    def encode(self, o):
        """Encode JSON object *o* with respect to single line lists."""

        if isinstance(o, (list, tuple)):
            self.indentation_level += 1

            output = ",\n".join([self.indent_str + self.encode(o_) for o_ in o])

            self.indentation_level -= 1
            return f'[\n{output}\n{self.indent_str}]'

        elif isinstance(o, dict):
            self.indentation_level += 1

            output = []
            for k, v in o.items():
                if k in ["to", "from", "to_if_canceled", "to_if_invoked", "bundle_identifiers", "to_after_key_up"]:
                    # write the values of these keys in one line
                    ser = f'{self.indent_str}"{k}": {json.dumps(v)}'

                elif k == "conditions":
                    # write the list entries of this key into single lines
                    self.indentation_level += 1
                    inner = ",\n".join([self.indent_str + json.dumps(v_) for v_ in v])
                    self.indentation_level -= 1
                    ser = f'{self.indent_str}"conditions": [\n{inner}\n{self.indent_str}]'

                else:
                    # normale formatting for dict entries
                    ser = f'{self.indent_str}{json.dumps(k)}: {self.encode(v)}'

                output.append(ser)

            self.indentation_level -= 1
            return "{\n" + ",\n".join(output) + "\n" + self.indent_str + "}"

        else:
            return json.dumps(o)

    @property
    def indent_str(self) -> str:
        return " " * self.indentation_level * self.indent


class ParseException(Exception):
    pass


if __name__ == "__main__":
    try:
        if not len(sys.argv) == 3:
            raise ParseException()
        input_folder = sys.argv[1]
        output_folder = sys.argv[2]

        conditions = [
            len(sys.argv) == 3,
            os.path.isdir(input_folder),
            os.path.isdir(output_folder)
        ]

        if not all(conditions):
            raise(ParseException())
        main(input_folder, output_folder)
    except ParseException as e:
        print(f"Usage: python {sys.argv[0]} $FOLDER_WITH_JSON_FILES $OUTPUT_FOLDER")
        print("")
        print("  e.g. python ~/configs/configs/karabiner/json/ ~/.config/karabiner/assets/complex_modifications")
        print(e)

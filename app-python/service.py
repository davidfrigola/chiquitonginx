from flask import Flask

app = Flask(__name__)

endpoints = [100,101,102,
		200,201,202,203,204,205,206,207,226,
		300,301,302,303,304,305,306,307,308,
		400,401,402,403.404,405,406,407,408,409,410,
		411,412,413,414,415,416,417,418,
		421,422,423,424,425,426,428,429,
		431,
		451,
		500,501,502,503,504,505,506,507,508,509,510,511]

def valid(code):
    return code in endpoints


@app.route("/<int:code>")
def hello(code):
    content=""
    if (valid(code)):
        return content, code
    else:
        return content, 500


if __name__ == "__main__":
    app.run(host='0.0.0.0',port=8080)

from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hi, Just a simple demo to showcase provisioners on Terraform! :)"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
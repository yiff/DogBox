from flask import Flask,render_template

app = Flask(__name__)
app.config['SECRET_KEY'] = "dog420lol"

@app.route("/")  # this sets the route to this page
def home():
        return render_template('index.html')

if __name__ == "__main__":
    app.run()
from flask import Flask,render_template
import urllib.parse
import urllib.request

app = Flask(__name__)
app.config['SECRET_KEY'] = "dog420lol"

def submitInformation(url,parameters):
	encodedParams = urllib.parse.urlencode(parameters).encode("utf-8")
	req = urllib.request.Request(url)
	net = urllib.request.urlopen(req,encodedParams)
	return(net.read())

url = "http://simhost-04759f8c54b30a5ca.agni.secondlife.io:12046/cap/11f74117-1ceb-eedf-656e-603ea8abcb61" # set manually from the URL provided in chat after running the LSL script
parameters = {'color':'white'}

@app.route("/")  # this sets the route to this page
def home():
	return render_template('index.html')

@app.route("/red/")
def red():
	print('Prim remotely changed colors to Red.')
	parameters = {'color':'red'}
	info = submitInformation(url,parameters)
	return render_template('index.html')

@app.route("/green/")
def green():
	print('Prim remotely changed colors to Green.')
	parameters = {'color':'green'}
	info = submitInformation(url,parameters)
	return render_template('index.html')

@app.route("/blue/")
def blue():
	print('Prim remotely changed colors to Blue.')
	parameters = {'color':'blue'}
	info = submitInformation(url,parameters)
	return render_template('index.html')

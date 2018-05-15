from flask import Flask
from view import api


app = Flask(__name__)
api.init_app(app)


if __name__ == '__main__':
    app.run(debug=True, threaded=True, host='0.0.0.0', port=8081)

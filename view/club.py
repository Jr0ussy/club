from flask import jsonify, request
from flask_restplus import Namespace, Resource
from service.club import Club

api = Namespace('application', description='Application API')


@api.route("club")
class ViewExcel(Resource):

    def __init__(self, api):
        Resource.__init__(self, api)
        self._club = Club()

    def get(self):
        return self._club.get_something()

    def post(self):
        return self._club.get_something()


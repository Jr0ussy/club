from flask_restplus import Api
from view.club import api as excel_api


api = Api(
    title='Club',
    version='0.1',
    description='Club',
    doc='/apidoc/'
)

api.add_namespace(excel_api, path='/')

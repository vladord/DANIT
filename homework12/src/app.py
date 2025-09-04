from flask import Flask
from flask_restful import reqparse, abort, Api, Resource
import csv

class StudentList(Resource):
    def __init__(self):
        self.csv_file = 'students.csv'

    def csv_to_list(self):
        data = []
        with open(self.csv_file, "r", newline="") as f:
            reader = csv.DictReader(f)
            for row in reader:
                data.append(dict(row))
        return data
    
    def list_to_csv(self, data):
        with open(self.csv_file, "w", newline="") as f:
            fieldnames = data[0].keys()
            writer = csv.DictWriter(f, fieldnames=fieldnames)
            writer.writeheader()
            writer.writerows(data)
        return
    
    def find_entry(self, key, value):
        return_value = []

        for row in self.csv_to_list():
            if str(row[key]) == str(value):
                return_value.append(row)
        
        if return_value == []:
            abort(406, message=f"Failed to find entry by {key} {value}")
        else: return return_value

    def pop_entry(self, id):

        data = self.csv_to_list()

        for row in data:
            if row['id'] == str(id):
                entry = row
                data.remove(row)
                break
        else: abort(406, message=f"Failed to find entry by id {id}")

        self.list_to_csv(data)
        return entry

    def add_entry(self, firstname, lastname, age):
        data = self.csv_to_list()
        id = int(data[-1]['id']) + 1
        data_to_add = {'id': id, 
                       'firstname': firstname, 
                       'lastname': lastname, 
                       'age': age}
        
        data.append(data_to_add)
        self.list_to_csv(data)
        return f"Added data {data_to_add}"

    def update_entry(self, args):
        data = self.csv_to_list()
        entry = self.find_entry('id', args['id'])[0]

        for row in data:
            if row['id'] == str(args['id']):
                for key, value in args.items():
                    if value is not None:
                        row[key] = value
                entry = row
                break

        self.list_to_csv(data)
        return entry
 
    def home(self):
        return "Home page"
        
    def get(self, request = ""):

        if request == "":
            return self.home()

        if request == "All":
            return self.csv_to_list()

        if isinstance(request, int):
            return self.find_entry('id', request)
        elif isinstance(request, str):
            return self.find_entry('lastname', request)
        else: abort(422, message=f"Unknown request type")
        
    def put(self):
        put_parser = reqparse.RequestParser(bundle_errors= True)
        put_parser.add_argument('id', required=True)        
        put_parser.add_argument('firstname')
        put_parser.add_argument('lastname')
        put_parser.add_argument('age')        
        args = put_parser.parse_args(strict=True)
        updated_entry = self.update_entry(args)

        return f"Updated entry: {updated_entry}"
    def post(self):
        post_parser = reqparse.RequestParser(bundle_errors= True)
        post_parser.add_argument('firstname', required=True)
        post_parser.add_argument('lastname', required=True)
        post_parser.add_argument('age', required=True)
        args = post_parser.parse_args(strict=True)
        new_entry = self.add_entry(args['firstname'], args['lastname'], args["age"])
        return f"New entry: {new_entry}" 
        
    def patch(self):
        patch_parser = reqparse.RequestParser(bundle_errors= True)
        patch_parser.add_argument('id', required=True) 
        patch_parser.add_argument('age', required=True)        
        args = patch_parser.parse_args(strict=True)

        updated_entry = self.update_entry(args)
        return f"Updated entry: {updated_entry}"    
    
    def delete(self):
        put_parser = reqparse.RequestParser(bundle_errors= True)
        put_parser.add_argument('id', required=True)          
        args = put_parser.parse_args(strict=True)        

        deleted_entry = self.pop_entry(args['id'])
        return f"Deleted entry: {deleted_entry}"     

if __name__ == "__main__":
    app = Flask(__name__)
    api = Api(app)
    api.add_resource(StudentList, "/","/student/<int:request>", "/student/<string:request>")
    app.run(host="0.0.0.0", port=80, debug=True)

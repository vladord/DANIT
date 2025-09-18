import csv
import requests
import logging

logging.basicConfig(level=logging.DEBUG,
                    format='%(asctime)s %(name)-12s %(levelname)-8s %(message)s',
                    datefmt='%m-%d %H:%M',
                    filename='./results.txt',
                    filemode='w')

console = logging.StreamHandler()
console.setLevel(logging.INFO)
formatter = logging.Formatter('%(name)-12s: %(levelname)-8s %(message)s')
console.setFormatter(formatter)
logging.getLogger().addHandler(console)
logging.info('Jackdaws love my big sphinx of quartz.')
logger1 = logging.getLogger(' ')

def create_data(csv_file):
    data = [
        {'id': 1, 'firstname': 'Anton', 'lastname': 'Melnyk', 'age': 54},
        {'id': 2, 'firstname': 'Andriy', 'lastname': 'Tkachuk', 'age': 26},
        {'id': 3, 'firstname': 'Anna', 'lastname': 'Kononchuk', 'age': 9},
        {'id': 4, 'firstname': 'Anastasia', 'lastname': 'Shalak', 'age': 19},
        {'id': 5, 'firstname': 'Artem', 'lastname': 'Buryak', 'age': 45},
        {'id': 6, 'firstname': 'Artur', 'lastname': 'Snitko', 'age': 2}
    ]

    with open(csv_file, 'w', newline='') as f:
        fieldnames = ['id', 'firstname', 'lastname', 'age']
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(data)


"""        
curl -i -X GET http://192.168.90.29:80/students/1
curl -X POST http://192.168.90.29:80/ -H "Content-Type: application/json" -d '{"firstname": "Vlad", "lastname": "Ordynskyi", "age": "30"}'
curl -X POST http://192.168.90.29:80/ -H "Content-Type: application/json" -d '{"firstname": "Vlad", "lastname": "Ordynskyi","age": "30", "huge": "30"}'
curl -X PUT http://192.168.90.29:80/ -H "Content-Type: application/json" -d '{"id": "5", "age": "5"}'
curl -X DELETE http://192.168.90.29:80/ -H "Content-Type: application/json" -d '{"id": "5"}
curl -X PATCH http://192.168.90.29:80/ -H "Content-Type: application/json" -d '{"id": "2", "age": "90"}'
"""

if __name__ == "__main__":
    csv_file = 'students.csv'
    create_data(csv_file)

    logger1.info("Retrieve All existing students (GET)")
    all_students = requests.get('http://127.0.0.1:80/student/All')
    logger1.info(f"Response status code: {all_students} \nData: {all_students.json()}")

    logger1.info("Create three students (POST)")
    data = {"firstname": "Vlad", "lastname": "Ordynskyi", "age": "30"}
    post_request = requests.post('http://127.0.0.1:80', json=data)
    logger1.info(f"Response status code: {post_request} \n Data: {post_request.json()}")

    data = {"firstname": "Olha", "lastname": "Ordynskyi", "age": "40"}
    post_request = requests.post('http://127.0.0.1:80', json=data)
    logger1.info(f"Response status code: {post_request} \n Data: {post_request.json()}")

    data = {"firstname": "Anna", "lastname": "Ordynskyi", "age": "5"}
    post_request = requests.post('http://127.0.0.1:80', json=data)
    logger1.info(f"Response status code: {post_request} \n Data: {post_request.json()}")

    logger1.info("Retrieve information about all existing students (GET)")

    all_students = requests.get('http://127.0.0.1:80/student/All')
    logger1.info(f"Response status code: {all_students} \n Data: {all_students.json()}")

    logger1.info("Update the age of the second student (PATCH)")

    data = {"id": "2", "age": "90"}
    patch_request = requests.patch('http://127.0.0.1:80', json=data)
    logger1.info(f"Response status code: {patch_request} \n Data: {patch_request.json()}") 

    logger1.info("Retrieve information about the second student (GET)")

    get_second_student = requests.get('http://127.0.0.1:80/student/2')
    logger1.info(f"Response status code: {get_second_student} \n Data: {get_second_student.json()}")       

    logger1.info("Update the fist name, last name and the age of the third student (PUT)")

    data = {"id": "3", "firstname": "Name", "lastname": "Family", "age": "900"}
    put_request = requests.put('http://127.0.0.1:80', json=data)
    logger1.info(f"Response status code: {put_request} \n Data: {put_request.json()}") 

    logger1.info("Retrieve information about the third student (GET)")

    get_third_student = requests.get('http://127.0.0.1:80/student/3')
    logger1.info(f"Response status code: {get_third_student} \n Data: {get_third_student.json()}") 

    logger1.info("Retrieve All existing students (GET)")

    all_students = requests.get('http://127.0.0.1:80/student/All')
    logger1.info(f"Response status code: {all_students} \n Data: {all_students.json()}")    

    logger1.info("Delete the first user (DELETE)")

    data = {"id": "1"}
    delete_request = requests.delete('http://127.0.0.1:80', json=data)
    logger1.info(f"Response status code: {delete_request} \n Data: {delete_request.json()}") 

    logger1.info("Retrieve All existing students (GET)")

    all_students = requests.get('http://127.0.0.1:80/student/All')
    logger1.info(f"Response status code: {all_students} \n Data: {all_students.json()}")       

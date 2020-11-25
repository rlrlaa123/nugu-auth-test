from flask import request, json
import db

commonResponse = {
    'version': '2.0',
    'resultCode': 'OK',
    'output': {}
}

def question(index):
    response = commonResponse
    print(db.getExam())
    response['output']['question'] = db.getExam()[index-1][1]

    return json.dumps(response)

def answer(index):
    data = json.loads(request.get_data().decode('utf8').replace("'", '"'))
    myAnswer = data['action']['parameters']['answer']['value']

    answer = db.getExam()[index-1][2]

    if answer == myAnswer:
        correctness = '정답입니다.'
    else:
        correctness = '오답입니다.'

    response = commonResponse
    response['output']['correctness'] = correctness

    return json.dumps(response)
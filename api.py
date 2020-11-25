#-*-coding:utf-8-*-
from flask import Flask, request, json
import db
import nugu
import auth

readCount = 1

commonResponse = {
    'version': '2.0',
    'resultCode': 'OK',
    'output': {}
}

app = Flask(__name__)

@app.route('/', methods=['GET'])
def getUser():
    return db.getTest()

@app.route('/post', methods=['POST'])
def saveUser():
    return db.postTest()

@app.route('/studyStart', methods=['POST'])
def studyStart():
    wordSet = 'TOEIC'
    subWordSet = 'Chapter 2'

    response = commonResponse
    response['output']['wordSet'] = wordSet
    response['output']['subWordSet'] = subWordSet

    return json.dumps(response)

@app.route('/examStart', methods=['POST'])
def examStart():
    wordSet = 'TOEIC'
    subWordSet = 'Chapter 2'
    wordSetId = 1
    subWordSetId = 2

    # token parsing
    data = json.loads(request.get_data().decode('utf8').replace("'", '"'))
    token = data['context']['session']['accessToken']

    # 회원인지 확인 -> POST https://api.github.com/user
    url = "https://api.github.com/user"
    userId = auth.requestUser(url, token)

    # response에 type이 어떤지 알아봐야 함.
    # response 값에 따라 user DB 구
    # 회원 없으면,
    if db.getUser(userId) != '':
        # 회원 DB에 등록
        db.setUser(userId)
    # 회원 있으면,
    else:
        # token만 저장
        db.setToken(userId, token)

    # exam table flush
    db.deleteExam()

    # exam table에 공부할 단어 등록
    words = db.getExamWords(wordSetId, subWordSetId)
    # print(words)
    for word in words:
        db.setExamWords(word[0], word[1])

    response = commonResponse
    response['output']['testWordSet'] = wordSet
    response['output']['testSubWordSet'] = subWordSet

    return json.dumps(response)

@app.route('/word_1', methods=['POST'])
def word_1():
    word = db.getWord(1)

    response = commonResponse
    response['output']['word'] = word[0][0]
    response['output']['meaning'] = word[0][1]

    return json.dumps(response)

@app.route('/word_2', methods=['POST'])
def word_2():
    word = db.getWord(2)

    response = commonResponse
    response['output']['word'] = word[0][0]
    response['output']['meaning'] = word[0][1]

    return json.dumps(response)

@app.route('/word_3', methods=['POST'])
def word_3():
    word = db.getWord(3)

    response = commonResponse
    response['output']['word'] = word[0][0]
    response['output']['meaning'] = word[0][1]

    return json.dumps(response)

@app.route('/question_1', methods=['POST'])
def question_1():
    return nugu.question(1)

@app.route('/answer_1', methods=['POST'])
def answer_1():
    return nugu.answer(1)

@app.route('/question_2', methods=['POST'])
def question_2():
    return nugu.question(2)

@app.route('/answer_2', methods=['POST'])
def answer_2():
    return nugu.answer(2)

@app.route('/question_3', methods=['POST'])
def question_3():
    return nugu.question(3)

@app.route('/answer_3', methods=['POST'])
def answer_3():
    return nugu.answer(3)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5500, debug=True)
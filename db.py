import pymysql
from pprint import pprint

def initDB():
    db = pymysql.connect(
        host='localhost',
        port=3306,
        user='my_user',
        passwd='1q2w3e4R!',
        db='brainEngraver',
        charset='utf8'
    )
    return db

def getDB(query, parameter):
    db = initDB()
    cursor = db.cursor()
    sql = query
    cursor.execute(sql, parameter)
    rows = cursor.fetchall()
    db.commit()
    db.close()
    if len(rows) == 0:
        return 0
    else:
        return rows

def setDB(query, parameter):
    db = initDB()
    cursor = db.cursor()
    cursor.execute(query, parameter)
    db.commit()
    db.close()

def postTest():
    db = initDB()
    cursor = db.cursor()

    sql = "INSERT INTO User(id, userId, name, password) VALUES (6, 'kiMin', 'kiMin', '1234');"
    cursor.execute(sql)

    db.commit()
    db.close()

    return '200'

def getTest():
    db = initDB()
    cursor = db.cursor()
    sql = 'SELECT * FROM `User`'
    cursor.execute(sql, ())
    rows = cursor.fetchall()
    db.commit()
    db.close()
    if len(rows) == 0:
        return 0
    else:
        return str(rows)

def getWord(id):
    sql = 'SELECT word, meaning FROM Word WHERE wordSetId = 1 AND subWordSetId = 2 AND id = %s'
    return getDB(sql, (id))

def getAnswer(question_id):
    sql = 'SELECT meaning FROM Word WHERE id = %s'
    return getDB(sql, (question_id))

def getWordSet(data):
    sql = 'SELECT name, meaning FROM Word WHERE wordSetId = %s AND subWordSetId = %s'
    return getDB(sql, (data['wordSet'], data['subWordSet']))

def getExamWords(wordSetId, subWordSetId):
    sql = 'SELECT word, meaning FROM Word WHERE  wordSetId = %s AND subWordSetId = %s'
    return getDB(sql, (wordSetId, subWordSetId))

def setExamWords(word, meaning):
    sql = 'INSERT INTO Exam (word, meaning) VALUES (%s, %s)'
    setDB(sql, (word, meaning))

def deleteExam():
    sql = 'DELETE FROM Exam'
    setDB(sql, ())

def getExam():
    sql = 'SELECT * from Exam'
    return getDB(sql, ())

if __name__ == '__main__':
    # p(getCalendar('개강'))
    # p(getCalendar('중간고사'))
    # p(getCalendarIncludeSemester('중간고사','1학기'))
    # p(getNoticeIncludeLink(1))
    # p(getNotice())
    pass
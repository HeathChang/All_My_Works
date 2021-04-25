import requests
from bs4 import BeautifulSoup
import csv
import urllib.request
import ssl

url = "https://store.steampowered.com/search/?l=korean"


res = requests.get(url)
res.raise_for_status()
soup = BeautifulSoup(res.text, "lxml")
# 인덱스는 항상 0부터 YOU BITCH
idx = 0
secondCount = 1
news = soup.find("div", attrs={"id": "search_resultsRows"})
gameGenre = []

## SSL 요청은 인증 Certificate 가 필요한데 이거 bypass 하는거
unv_context = ssl._create_unverified_context()

for a in news.select("a", attrs={"class": "search_result_row ds_collapse_flag  app_impression_tracked"}):
    # index올라감
    print("===============", idx + 1, "번째 게임입니다.===============")
    print(a)

    # 각 게임마다의 url 가지고 오기
    urlSearch = a.get('href')

    # 해당 url를 가지고 새로운 웹사이트로 들어가기 (2번째 bs4 시작)
    res = requests.get(urlSearch)
    res.raise_for_status()
    soup = BeautifulSoup(res.text, "lxml")

    # 게임 타이틀 이름
    ainTitle = soup.find(
        "div", attrs={"class": "title"})
    inTitle = ainTitle.get_text()
    print("게임 이름: ", inTitle)

    # 게임 이미지
    ainImage = soup.find(
        "img", attrs={"class": "game_header_image_full"})
    imgUrl = ainImage.get('src')
    r = requests.get(imgUrl, stream=True)
    if r.status_code == 200:
        with open('./img/' + inTitle + '.jpg', 'wb') as h:
            r.raw.decode_content = True
            h.write(r.content)

    # User Agent 에러가 남.
    # 보통 requests user agent 는 잘 안막는데
    # 만약에 requests 도 막히면 user agent 변경하는 코드 참고
    # with urllib.request.urlopen(imgUrl) as f:
    #     with open('./img/'+inTitle+'.jpg', 'wb') as h:
    #         ainImage = f.read()
    #         h.write(ainImage)

    # 게임 타이틀 내용/요약
    inContent = soup.find("div", attrs={"class": "game_description_snippet"})
    if inContent is None:
        inContent = "관련 설명이 없습니다."
    else:
        inContent = inContent.get_text().strip()
    print("게임 설명: ", inContent)

    # 게임 출시일
    ainDate = soup.find("div", attrs={"class": "date"})
    inDate = ainDate.get_text()
    print("게임 출시일: ", inDate)

    # 한번만 열고 한번에 다 작성하기
    with open('result.csv', 'a') as csvFile:
        writer = csv.writer(csvFile)

        # 기존 버그는 너가 게임 룹 돌때마다 writer.writerow 를 실행해줘서 그럼
        if idx == 0:
            writer.writerow(('game_name', 'game_content',
                         'game_date', "game_genre"))

        for inGenre in soup.find_all("a", attrs={"class": "app_tag"}, limit=5):
            singleGenre = inGenre.get_text().strip()
            gameGenre.append(singleGenre)
            secondCount = secondCount + 1

            if len(gameGenre) == 5:
                writer.writerow((inTitle, inContent, inDate, '[' + ','.join(gameGenre) + ']'))
                gameGenre.clear()

        # writer = csv.writer(csvFile)
        #
        # # 게임 태그 (5개까지만)
        # for inGenre in soup.find_all("a", attrs={"class": "app_tag"}, limit=5):
        #     # print("게임 장르: ", inGenre.get_text().strip())
        #     singleGenre = inGenre.get_text().strip()
        #     gameGenre.append(singleGenre)
        #     secondCount = secondCount+1
        #     print(gameGenre)
        #     if len(gameGenre) == 5:
        #         print('write')
        #         writer.writerow(('game_name', 'game_content',
        #                              'game_date', "game_genre"))
        #         writer.writerow((inTitle, inContent, inDate, gameGenre))
        #     gameGenre.clear()
    # 인덱스 업은 항상 마지막에!
    idx += 1
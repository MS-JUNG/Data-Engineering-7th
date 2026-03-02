# Spark Standalone Cluster with Docker

## 실행 방법


2) Spark Web UI 확인
- http://localhost:8080

3) Pi 예제 실행
```bash
docker compose exec spark-master bash /scripts/submit_pi.sh
```
로그에서 `Pi is roughly ...` 확인

4) WordCount 실행
```bash
docker compose exec spark-master bash /scripts/submit_wordcount.sh
```
결과 확인:
```bash
ls -la output/wordcount
head -n 5 output/wordcount/*.csv
```

## 입력/출력 경로
- 입력: `data/input.txt` -> 컨테이너 `/data/input.txt`
- 출력: `output/wordcount` -> 컨테이너 `/output/wordcount`
- Pi 로그: `output/pi/pi.log`

## 오류/로그 확인
- 마스터/워커 로그:
```bash
docker compose logs spark-master
docker compose logs spark-worker-1
docker compose logs spark-worker-2
```
- Spark 앱 로그: `output/pi/pi.log`


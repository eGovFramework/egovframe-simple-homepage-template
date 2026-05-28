# Kubernetes 운영 가이드

egovframe-simple-homepage-template 애플리케이션을 Kubernetes 클러스터에 배포하고 운영하는 절차를 설명합니다.

## 매니페스트 구성

| 파일 | 설명 |
|------|------|
| `deployment.yaml` | Deployment (replicas: 1, RollingUpdate, readiness/liveness 프로브 포함) |
| `service.yaml` | Service (ClusterIP, 포트 8080) |

---

## 1. 빌드 및 이미지 생성

프로젝트 루트에서 Docker 이미지를 빌드합니다.

```bash
# 프로젝트 루트로 이동
cd egovframe-simple-homepage-template

# Docker 이미지 빌드
docker build -t egovframe-simple-homepage-template:5.0.0 .

# (선택) 레지스트리에 푸시할 경우 태그 추가
docker tag egovframe-simple-homepage-template:5.0.0 \
  ghcr.io/<org>/egovframe-simple-homepage-template:5.0.0

docker push ghcr.io/<org>/egovframe-simple-homepage-template:5.0.0
```

> 레지스트리를 사용할 경우 `k8s/deployment.yaml`의 `image` 필드를 실제 레지스트리 주소로 변경합니다.

---

## 2. 배포

```bash
# 매니페스트 일괄 적용
kubectl apply -f k8s/

# 또는 파일별 순서대로 적용
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
```

---

## 3. 배포 상태 확인

```bash
# Deployment 롤아웃 완료 대기
kubectl rollout status deployment/egov-simple-homepage

# Pod 목록 확인 (STATUS: Running 확인)
kubectl get pods -l app.kubernetes.io/name=egov-simple-homepage

# Pod 상세 정보 (이벤트, probe 상태 포함)
kubectl describe pod -l app.kubernetes.io/name=egov-simple-homepage

# Service 확인
kubectl get service egov-simple-homepage
```

---

## 4. 접속

### ClusterIP (기본) — 클러스터 내부에서 접근

```
http://egov-simple-homepage:8080
```

### kubectl port-forward — 로컬 PC에서 직접 접근

```bash
kubectl port-forward service/egov-simple-homepage 8080:8080
```

브라우저에서 `http://localhost:8080` 으로 접속합니다.

### minikube — minikube 환경

```bash
# NodePort로 Service 타입 변경 후 접근
kubectl patch service egov-simple-homepage \
  -p '{"spec": {"type": "NodePort"}}'

minikube service egov-simple-homepage --url
```

출력된 URL로 브라우저에서 접속합니다.

---

## 5. 로그 확인

```bash
# 실시간 로그 스트리밍
kubectl logs -f deployment/egov-simple-homepage

# 이전 컨테이너 로그 (재시작된 경우)
kubectl logs deployment/egov-simple-homepage --previous
```

---

## 6. 스케일 조정

```bash
# 레플리카 수 조정
kubectl scale deployment egov-simple-homepage --replicas=3

# 오토스케일링 (HPA)
kubectl autoscale deployment egov-simple-homepage \
  --cpu-percent=70 --min=1 --max=5
```

---

## 7. 업데이트 및 롤백

```bash
# 이미지 업데이트 (새 버전 배포)
kubectl set image deployment/egov-simple-homepage \
  app=egovframe-simple-homepage-template:5.0.1

# 롤아웃 이력 확인
kubectl rollout history deployment/egov-simple-homepage

# 이전 버전으로 롤백
kubectl rollout undo deployment/egov-simple-homepage
```

---

## 8. 리소스 정리

```bash
kubectl delete -f k8s/
```

---

## 참고

- 컨테이너 포트: **8080** (HTTP)
- Readiness 프로브: `GET /` (초기 대기 30초, 10초 간격, 6회 실패 시 트래픽 차단)
- Liveness 프로브: `GET /` (초기 대기 90초, 20초 간격, 3회 실패 시 컨테이너 재시작)
- 보안 컨텍스트: 비루트(UID 1000) 실행, 권한 상승 비허용

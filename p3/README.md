
k3d cluster create
k3d cluster delete
k3d cluster list
k3d cluster start
k3d cluster stop

https://argo-cd.readthedocs.io/en/stable/getting_started/



argocd app create guestbook --repo https://github.com/argoproj/argocd-example-apps.git --path guestbook --dest-server https://kubernetes.default.svc --dest-namespace default


apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: argocd-wilapp
  namespace: argocd
spec:
  destination:
    namespace: dev
    server: https://kubernetes.default.svc
  project: default
  source:
    repoURL: https://github.com/zamazzal/iot-app.git
    path: .
    targetRevision: master
  syncPolicy:
    prune: true
    selfHeal: true


argocd app get guestbook  (view status of app)
Name:               guestbook
Server:             https://kubernetes.default.svc
Namespace:          default
URL:                https://10.97.164.88/applications/guestbook
Repo:               https://github.com/argoproj/argocd-example-apps.git
Target:
Path:               guestbook
Sync Policy:        <none>
Sync Status:        OutOfSync from  (1ff8a67)
Health Status:      Missing

argocd app sync guestbook (sync manually, This command retrieves the manifests from the repository and performs a kubectl apply of the manifests.)
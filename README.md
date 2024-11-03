# JupyterLabCV
### Готовый сервис JupyterLab для разработок в сфере компьютерного зрения:


Для начала склонируйте репозиторий на свой компьютер. После клонирования откройте терминал и перейдите в директорию с репозиторием. 

Далее вам нужно выполнить соответствующую команду. После установки запустите команду, которая сгенерирует вам токен. Скопируйте полученный токен.

Затем перейдите в браузере по адресу http://localhost:8789. На этой странице вы сможете создать свой собственный пароль, используя скопированный токен. После этого ресурс с JupyterLab будет доступен вам по адресу http://localhost:8789, и вы сможете использовать его с созданным паролем.

---
### Запуск сервиса JupyterLab:

Образ, в котором имеется сразу TensorFlow и PyTorch с доступом к GPU:

```
docker-compose -f docker-compose-gpu-torch-tf.yml -p jupyter_lab_cv up -d --build
```


---

### Получение токена чтобы авторизоваться и создать пароль в среде JupyterLab:
```
docker exec jupyter_lab_cv jupyter server list
```

### Команда для создания образа:
```
docker build -t jupyter_lab_cv:1.0.0 .
```

### Команда для запуска контейнера:
```
docker run -it --name jupyter_lab_cv --volume=/home/alex/Dev/CV/playground:/playground -p 8789:8789 --gpus all --rm jupyter_lab_cv:1.0.0
```

## Отвязка docker от sudo:
```
sudo groupadd docker
sudo gpasswd -a $USER docker
sudo chmod 666 /var/run/docker.sock
```
# Docker для qBittorrent

Данный **Dockerfile** позволяет создать компактный образ на основе [**Alpine Linux**](https://alpinelinux.org/) для торрент клиента [**qBittorrent**](https://www.qbittorrent.org).

## Основные возможности

Получаем торрент клиент с управлением по web-интерфейсу без необходимости установки на базе дистрибутива очень небольшого размера.

### Необходимое ПО

Любая операционная система с установленной [**docker средой**](https://www.docker.com) (и пакетом **git** для самостоятельной сборки).

### Установка

Можно скачать данный **Dockerfile** и самому собрать образ:

```
git clone https://github.com/acmodeu/qbittorrent.git
cd qbittorrent
docker build -t acmodeu/qbittorrent:latest .
```

А можно воспользоваться уже собранным образом, скачав его с [**докер-хаба**](https://hub.docker.com/repository/docker/acmodeu/qbittorrent):

```
docker pull acmodeu/qbittorrent
```

## Запуск и доступ

```
docker run -d --name qbt --network host --restart unless-stopped
-v /etc/localtime:/etc/localtime:ro -v /etc/timezone:/etc/timezone:ro
-v ~/.config:/qbconfig -v /data:/data acmodeu/qbittorrent
```
По умолчанию веб интерфейс доступен на порту 8080, логин **admin**, пароль **adminadmin**.
Также по умолчанию настройки qBittorrent находятся в каталоге **.config** домашнего каталога,
а для хранения скачанного используется папка **/data**.

@ECHO OFF

IF [%1]==[] (
    echo "Usage: %0 {start|stop|purge|tail}"
    GOTO END
)

IF %1==start (
    CALL :start
    CALL :tail
    GOTO END
)
IF %1==stop (
    CALL :down
    GOTO END
)
IF %1==purge (
    CALL:down
    CALL:purge
    GOTO END
)
IF %1==tail (
    CALL :tail
    GOTO END
)

echo "Usage: %0 {start|stop|purge|tail}"
:END
EXIT /B %ERRORLEVEL%

:start
    docker volume create aps-db-sa-volume
    docker volume create aps-admin-db-sa-volume
    docker volume create aps-contentstore-sa-volume
	docker volume create aps-es-sa-volume
    docker-compose up --build -d
EXIT /B 0
:down
    docker-compose -f "%COMPOSE_FILE_PATH%" down
EXIT /B 0
:tail
    docker-compose logs -f
EXIT /B 0
:tail_all
    docker-compose logs --tail="all"
EXIT /B 0
:purge
    docker volume rm aps-db-sa-volume
    docker volume rm aps-admin-db-sa-volume
    docker volume rm aps-contentstore-sa-volume
	docker volume rm aps-es-sa-volume
EXIT /B 0
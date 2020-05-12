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
    docker volume create aps-db-volume
    docker volume create aps-admin-db-volume
    docker volume create aps-contentstore-volume
	docker volume create aps-es-volume
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
    docker volume rm aps-db-volume
    docker volume rm aps-admin-db-volume
    docker volume rm aps-contentstore-volume
	docker volume rm aps-es-volume
EXIT /B 0
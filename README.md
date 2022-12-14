### コンテナの終了

1. コマンドパレット > `Remote-Containers: Reopen Folder Locally`

2. ターミナル > `docker compose down`

### メモ

#### Oops! Select An Empty VSCode Workspace

新しいチュートリアルを開始する時に `Oops! Select An Empty VSCode Workspace` というエラーが表示された場合

- `/home/codeally/project/` 以下を空にする

  ```
  cd /home/codeally/project/
  rm -rf .*
  ```

- もしくはコンテナを終了してからボリュームを削除
  ```
  docker compose down
  docker volume ls
  docker volume rm rdb-alpha_codeally-project
  ```

#### psql: FATAL: Peer authentication failed for user "freecodecamp"

```
sudo sed -i 's/\/etc\/postgresql\/12\/main\/pg_hba.conf/\/home\/codeally\/project\/.freeCodeCamp\/pg_hba.conf/' /etc/postgresql/12/main/postgresql.conf

sudo service postgresql restart

psql --username=freecodecamp dbname=postgres
```

イメージに postgresql 再起動用のファイルをコピーしてあるので、以下を実行

```
cd /home/codeally/project/
../restart-postgresql.sh
```

#### コマンドを入力しても検知されなかったり、先へ進めない場合

`/home/codeally/project` にいることを確認してから CodeRoad の Reset ボタンをクリック

#### dump ファイル作成

```
cd /home/codeally/project

pg_dump -cC --inserts -U freecodecamp データベース名 > データベース名.sql
```

ローカルマシン側にコピー

```
docker compose cp app:/home/codeally/project/データベース名.sql ${PWD}
```

### Prerequisites

1. [Docker Engine](https://docs.docker.com/engine/)
1. [VS Code](https://code.visualstudio.com/download) and the [Remote Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension
1. Git

### How to Run a Project in Docker

1. Clone the RDB Alpha repo with `git clone https://github.com/freeCodeCamp/rdb-alpha`
1. Open a terminal, navigate to the `rdb-alpha` directory, and open VSCode with `code .`
1. Press Ctrl / Cmd + Shift + P and enter `Remote-Containers: Rebuild Container and Reopen in Container`
1. A new VS Code window will open and begin building the Docker image. It will take several minutes to build the first time.
1. Once the image is finished building, press Ctrl / Cmd + Shift + P and enter `CodeRoad: Start` to open CodeRoad
1. In the CodeRoad window, click "Start New Tutorial"
1. Enter the URL to the `tutorial.json` file of the project you want to start (ex: https://raw.githubusercontent.com/freeCodeCamp/learn-bash-by-building-a-boilerplate/main/tutorial.json)
1. Click the "Start" button

There may be some additional troubleshooting steps to get the container running properly. They can often be solved by following the onscreen instructions, or examining any error messages in your terminal.

### How to Restart or Switch Projects

Note: If you restart or switch projects you will lose your progress, along with any files or directories you created.

1. Press Ctrl / Cmd + Shift + P and enter `Remote-Containers: Rebuild Container`
1. Wait for VS Code to reopen and reload the Docker container
1. Open CodeRoad, enter the URL to a `tutorial.json` file, and start the project as described above

### `tutorial.json` File URLs for CodeRoad

- [Learn Bash by Building a Boilerplate](https://raw.githubusercontent.com/freeCodeCamp/learn-bash-by-building-a-boilerplate/main/tutorial.json)
- [Learn Relational Databases by Building a Mario Database](https://raw.githubusercontent.com/freeCodeCamp/learn-relational-databases-by-building-a-mario-database/main/tutorial.json)
- [Celestial Bodies Database](https://raw.githubusercontent.com/freeCodeCamp/learn-celestial-bodies-database/main/tutorial.json)
- [Learn Bash Scripting by Building Five Programs](https://raw.githubusercontent.com/freeCodeCamp/learn-bash-scripting-by-building-five-programs/main/tutorial.json)
- [Learn SQL by Building a Student Database: Part 1](https://raw.githubusercontent.com/freeCodeCamp/learn-sql-by-building-a-student-database-part-1/main/tutorial.json)
- [Learn SQL by Building a Student Database: Part 2](https://raw.githubusercontent.com/freeCodeCamp/learn-sql-by-building-a-student-database-part-2/main/tutorial.json)
- [World Cup Database](https://raw.githubusercontent.com/freeCodeCamp/learn-world-cup-database/main/tutorial.json)
- [Learn Advanced Bash by Building a Kitty Ipsum Translator](https://raw.githubusercontent.com/freeCodeCamp/learn-advanced-bash-by-building-a-kitty-ipsum-translator/main/tutorial.json)
- [Learn Bash and SQL by Building a Bike Rental Shop](https://raw.githubusercontent.com/freeCodeCamp/learn-bash-and-sql-by-building-a-bike-rental-shop/main/tutorial.json)
- [Salon Appointment Scheduler](https://raw.githubusercontent.com/freeCodeCamp/learn-salon-appointment-scheduler/main/tutorial.json)
- [Learn Nano by Building a Castle](https://raw.githubusercontent.com/freeCodeCamp/learn-nano-by-building-a-castle/main/tutorial.json)
- [Learn Git by Building an SQL Reference Object](https://raw.githubusercontent.com/freeCodeCamp/learn-git-by-building-an-sql-reference-object/main/tutorial.json)
- [Periodic Table Database](https://raw.githubusercontent.com/freeCodeCamp/learn-periodic-table-database/main/tutorial.json)
- Learn GitHub by Building a List of Inspirational Quotes (in progress)
- [Number Guessing Game](https://raw.githubusercontent.com/freeCodeCamp/learn-number-guessing-game/main/tutorial.json)

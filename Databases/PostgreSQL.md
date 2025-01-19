
## Install PostgreSQL 

#### Mac
```zsh
brew install postgresql@15
```

#### Pi
- Download
```zsh
apt update
sudo apt install postresql
```

- Start running
```zsh
sudo systemctl enable postgresql
sudo systemctl start postgresql
```

- Change to postgresql shell
```zsh
sudo su postgres
```

- Add user
```postgreSQL
createuser user1 -P --interactive
```

- Update configs

- Config #1
```PostgreSQL
show hba_file; 
exit
```
- Copy file path
- Should be something like "/etc/postgresql/16/main/pg_hba.conf"

```zsh
sudo vi <hab_file path>
```
- Scroll to bottom

```
host    all             user1           0.0.0.0/0               scram-sha-256
```
- At very bottom under "Allow replication connections from localhost, by a user with the replication privilege."


- Config #2
```zsh
sudo vi /etc/postgresql/16/main/postgresql.conf
```
- Same file path as the one before but different file name "postgresql.conf"

```
listen_addresses = '*'
```
- Under "Connections and Authentication" and under "# - Connection Settings"

- Restart PostgreSQL
```zsh
sudo systemctl restart postgresql
```

## Connect to SQL

```zsh
psql -h <HOST> -p 5432 -d <DATABASE> -U <USER> -W
```
- HOST = 
	- Connecting to pi = k2pi2
	- Connecting on machine = localhost
- DATABASE = users
- USER = user1

#### Examples

- From Mac to Pi
```zsh
psql -h k2pi2 -p 5432 -d users -U user1 -W
```

- From Pi to Pi
```zsh
pqsl -h localhost -p 5432 -d users -U user1 -W
```


## Basic Commands

- Show Relations
```postgreSQL
\dt
```

- Show Table
```PostgreSQL
\d TABLE
```


## Create a Database

```SQL
CREATE DATABASE <DATABASE>;
```


## Create a Table

```sql
CREATE TABLE users (
	user_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	username varchar(50) NOT NULL UNIQUE,
	email varchar(255) NOT NULL UNIQUE
);
```


## Alter a Table

```sql
ALTER TABLE users
	ADD COLUMN name varchar(30) NOT NULL;
```


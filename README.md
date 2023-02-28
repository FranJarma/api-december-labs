
# December Labs - Transactions API

Repository for December Labs technical assesment.


## Run Locally

Clone the project

```bash
  git clone https://github.com/FranJarma/api-december-labs.git
```

Go to the project directory

```bash
  cd api-december-labs
```

Install dependencies

```bash
  npm install
```

Create .env file and populate it

Start the server with the following command

```bash
  docker-compose up
```


## Environment Variables

To run this project, you will need to add the following environment variables to your .env file

`DATABASE_URL="mysql://root:franjaDESA2040+.@db:3306/december-labs?schema=public"`

`MYSQL_ROOT_PASSWORD=franjaDESA2040+.`

`MYSQL_DATABASE=december-labs`

`MYSQL_USER=root`

`MYSQL_HOST=localhost`

`MYSQL_DATABASE=december-labs`

`FIXER_API_KEY=xOsmRtKPCytksTcZzHFtHWj1O7wcAZ3m`


## API Reference

#### Get transaction report

```http
  GET /api/report/transaction-report
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `from` | `string` | **Required**. From date string value |
| `to` | `string` | **Required**. To date string value |
| `userGuid` | `string` | **Required**. Request user guid |

#### Create new transfer

```http
  POST /api/transfer
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `userGuid`      | `string` | **Required**. Request user guid |
| `accountFrom`      | `object` | **Required**. Origin account |
| `accountTo`      | `string` | **Required**. Destiny account |
| `amount`      | `number` | **Required**. Transfer amount |
| `date`      | `string` | **Required**. Date string value |
| `description`      | `string` | **Optional**. Transfer description |

#### Get transfers ordered by creation date

```http
  GET /api/transfer
```
| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `userGuid`      | `string` | **Required**. Request user guid |

There is a file called December Labs.postman_collection in the repository with a Postman collection with all endpoints.

### Query Dockerized DB

```Transactions: docker exec -it CONTAINER_NAME mysql -p -e 'SELECT * from transactions' december-labs```

Note: CONTAINER_NAME has to be copied from Docker Desktop. In the container section once the docker-compose operation is finished. For example:

```613fe85f593af02883c39a983e0e4f6abfedec20386891f42276868ec8dc24f4```

## Authors

- [@FranJarma](https://www.github.com/FranJarma)


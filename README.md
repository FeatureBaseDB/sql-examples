# SQL Examples

This repository contains a collection of SQL examples that demonstrate various types of queries. The purpose of this repository is to serve as a reference for users looking to understand and learn different SQL query patterns.

## Structure

The repository is structured as follows:

sql-examples/
├── data/
│ ├── example1.sql
│ ├── example2.sql
│ └── ...
├── lib/
│ └── database.py
├── output.sql
└── README.md


- The `data/` directory contains a collection of `.sql` files, each representing a specific SQL query examples for a given table. These files are meant to showcase different query patterns and serve as a starting point for building more complex queries.

- The `lib/` directory contains the `database.py` module, which provides methods for generating new SQL queries. These methods can be used to create additional `.sql` files in the `data/` directory.

- The `output.sql` file is a log file generated by the `database.py` module. It records the SQL queries generated by the program.

## Contribution

Contributions to this repository are welcome! If you have a new SQL query example or improvements to existing examples, please feel free to submit a pull request. Make sure to follow the guidelines in the [CONTRIBUTING.md](CONTRIBUTING.md) file.

## License

This repository is licensed under the [MIT License](LICENSE). You are free to use, modify, and distribute the code and examples as per the terms of the license.

We hope you find this repository helpful in exploring different SQL query patterns and generating queries for your own projects. If you have any questions or feedback, please don't hesitate to reach out.

Happy querying!

## Example: Collatz Sequence Table
To create and populate the Collatz sequences in FeatureBase Cloud, get the token from Cloud first:

```
python3 fb_token.py
```

Put this token, along with the path of the endpoint in a file called 'config.py'. Reference 'config.py.sample' for the format.

Note that the `/query/sql` needs to be stripped from the end of the URL you use in the config file.

The result of a run will be a table called `collatz_flotz` in your account.

## Possible Queries
It would be interesting to build a query that traverses graphs.

More information: https://www.quantamagazine.org/why-mathematicians-still-cant-solve-the-collatz-conjecture-20200922/

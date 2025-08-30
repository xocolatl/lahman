# Lahman Baseball Database

This repository aims to normalize the data in the **Lahman Baseball
Database** to provide error detection and consistency across the
dataset. We use [PostgreSQL](https://www.postgresql.org/) for this,
but—with a few exceptions—uses only SQL Standard compliant language so
it should be able to be used anywhere with only some minor changes.

# Load-Transform-Export (LTE)

Git does not know how to record an empty directory as it works on the
file level, so I have included empty `sentinel` files.

Your directory structure looks like this:

    .
    ├── exports
    │   ├── input
    │   └── output
    └── imports

I cannot find a license on the original data, so you must [download the
CSV files](https://sabr.org/lahman-database/) and unzip them into the
`imports` directory yourself.

Then run from `psql` the three commands:

1.  \i import.sql
2.  \i transform.sql
3.  \i export.sql

After the export, the `exports/input/` files will contain the *exact
same contents* as in the `imports` directory, but sorted in such a way
as to make diff-ing them with the `exports/output/` files possible with
minimal noise.

Ideally, there should be no difference between `exports/input/` and
`exports/output/`. If there are, then these are bugs with either Sean
Lahman’s work, or with my own transformations. In either case, please
report them to the appropriate party.

# Extra Data

This repository also contains some personal research into data that I
think is missing, such as umpires. This data will not show up in the
exports until Sean Lahman decides to add it. Then the data will be
removed as extra and imported like the rest of the data.

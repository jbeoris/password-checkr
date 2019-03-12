# Password Checkr

Simple bash script using k-anonymity to detect passwords that have been cracked previously.

## Getting Started

Just run the `password_checkr.sh` script in your desired directory.

### Prerequisites

Bash 3.0 or higher

### Example Usage

Pretty straight-forward...

```
sh ./password_checkr.sh
> Enter Password and press [ENTER]: EXAMPLE_PASSWORD
```

WARNING: This will transmit a small portion of your SHA1 hashed password to an API. Make sure you trust this api and understand the consquences of doing this before continuing.

## Authors

* **Jack Beoris** - *Initial work* - [https://github.com/jbeoris](https://github.com/jbeoris)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

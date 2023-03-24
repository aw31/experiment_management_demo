import argparse
import logging
import os
import pprint

from utils import init_experiment, save_experiment_json

parser = argparse.ArgumentParser()
parser.add_argument("--handle", type=str, required=True)

# Load comment from EXPERIMENT_COMMENT environment variable
parser.add_argument("--comment", default=os.environ.get("EXPERIMENT_COMMENT", ""))


def main():
    args = parser.parse_args()
    init_experiment(args.handle)
    save_experiment_json("args", vars(args))

    logging.info(f"Running script.py with args:\n{pprint.pformat(vars(args))}")
    logging.info(f"This file has changed!")


if __name__ == "__main__":
    main()

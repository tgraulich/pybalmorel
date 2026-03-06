### 0.1 Use development scripts or the package installed from pip
use_development = True
if use_development:
    import sys
    import os
    # Adjust the sys.path to include the project root directory
    project_root = os.path.abspath(os.path.join(os.path.dirname("__file__"), '..'))
    if project_root not in sys.path:
        sys.path.insert(0, project_root)
    from src.pybalmorel import WEATHERYEAR
else:
    from pybalmorel import WEATHERYEAR

import os
import argparse

def get_args():
    parser = argparse.ArgumentParser(description="Process some arguments.")
    parser.add_argument('-y', '--year', default=2013, type=int, help='Wheather year')
    return parser.parse_args()

args = get_args()

wy = args.year

# Initiate WEATHERYEAR class
print("Running weather year ",wy)
mly = WEATHERYEAR(year=wy,
            config_fn="files/mutli_year_config.yml",
            output_folder="/work3/taigr/pybalmorel/examples/results",)

#mly.get_vre_data()
print("VRE timeseries created")


mly.get_demand_data()
print("Demand timeseries created")

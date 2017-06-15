# plot_utils.py
# utility function for exposing values from training process

# load dependencies
import json
import matplotlib
matplotlib.interactive(True)
import matplotlib.pyplot as plt
import numpy as np

# module for folder inspection
from os import listdir
from os.path import isfile, join


# function name:
#   get_data(path)
# purpose:
#   inspect the data folder and get all the items within
def get_data(path):
    filenames = [f for f in listdir(path) if isfile(join(path, f))]

    return filenames


# function name:
#   json_to_array(filenames, out)
# purpose:
#   given a set of json files, creates a json with all
#   the trained models grouped by metric
def json_to_array(filenames):
    # get all the json file
    # create a json file where to store values
    # strategy: the json structure will group set of same values
    # of different trained models given the metric
    # Ex:
    # data
    #   {'loss':
    #     { 'trained_model_1' : array(),
    #       'trained_model_1' : array().
    #     }
    # }
    data = {} # empty json
    models = []

    for filename in filenames:
        if filename.find('json') == -1:
            pass
        else:
            json_file = open(filename)
            # get the json file for a trained model
            lists = json.load(json_file)

            # get the trained model name
            trained_model = filename.split('.')[0]
            # list is of type dict and we can access its keys
            for key in lists.keys():
            # initialise the key if not in json
                if key not in data:
                    data[key] = {}

                # collect the lists
                data[key][trained_model] = lists[key]
                # --- end of keys loop

            # append the models
            models.append(trained_model)
            # --- end of filenames loop

    # return trained model names
    return data, models

# function name
#   plot_metric(data, metric, models)
# purpose:
#   plot a specific set of values for different
#   models (e.g. loss, metric) or different metrics
#
def plot_metric(data, metrics, models):
    # set up some different colors
    colors = "bkrgcmyw"
    index = 0

    # first iteration through the metrics
    for metric in metrics:
        # second iteration through the models
        for model in models:
            x = np.asarray(data[metric][model])
            # set the plot
            if len(models) is 1:
                plt.plot(x, colors[index]+'-', label=metric)
            else:
                plt.plot(x, colors[index]+'-', label=model)
            # update the counter
            index += 1

        # set plot specifics
        plt.xlabel('Epochs')


    if len(models) is not 1:
        plt.ylabel(metric+' value')
    plt.yscale('log') # plot in log scale
    plt.grid(True)
    plt.grid(b=True, which='minor', color='silver')
    plt.legend() # show the label
    plt.axis([0,100,0,4])

    # show the plot
    plt.show()



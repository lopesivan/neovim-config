# encoding: utf-8

import sys
import os
import os.path
import yaml

import models


def main():

    PATH = sys.argv[1]

    if os.path.isfile(PATH) and os.access(PATH, os.R_OK):
        # Load YAML file
        config_file = file(PATH, 'r')
        data_model = yaml.load(config_file)
        config_file.close()

        t = models.TClient(data_model, 'chef.conf.client')
        t.put()
        t.save()

        t = models.TKnife(data_model, 'chef.conf.knife')
        t.put()
        t.save()

        t = models.TSolo(data_model, 'chef.conf.solo')
        t.put()
        t.save()

        t = models.TDockerfile(data_model, 'chef.conf.dockerfile')
        t.put()
        t.save()
    else:
        print("Either file is missing or is not readable")


if __name__ == "__main__":
    main()

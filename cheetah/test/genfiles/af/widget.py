#!/usr/bin/env python
# encoding: utf-8

import os
import os.path
import yaml


def main():

    PATH = "widget.yaml"

    if os.path.isfile(PATH) and os.access(PATH, os.R_OK):

        config_file = file(PATH, 'r')
        dataModel = yaml.load(config_file)
        config_file.close()

        for factory in dataModel['factory']:
            print "%sFactory" % factory['abstract'].title()

            for t in dataModel['types']:
                print "%s%sFactory" \
                    % (t.title(), factory['abstract'].title())

            for t in dataModel['types']:
                print "++%s%sFactory" \
                    % (t.title(), factory['abstract'].title())

                for product in dataModel['products']:
                    print "create%s" % product['abstract']

                    print "%s%s" \
                        % (product['abstract'], t.title())

    else:
        print "Either file is missing or is not readable"

if __name__ == "__main__":
    main()

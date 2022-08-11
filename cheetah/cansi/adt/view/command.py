#!/usr/bin/env python
# encoding: utf-8

import yaml
from AbstractFactory import AbstractFactory
from optparse import OptionParser


def main():
    parser = OptionParser(usage="usage: %prog [options]",
                          version="%prog 1.0")

    parser.add_option("-w", "--write",
                      action="store_true",
                      dest="write_files",
                      default=False,
                      help="Enable create a CANSI template file instead of ADT")

    parser.add_option("-f", "--file",
                      action="store",
                      dest="yaml_file",
                      default="adt.yaml",
                      help="YAML file to parser",)

    (options, args) = parser.parse_args()

    print options

    config_file = file(options.yaml_file, 'r')
    dataModel = yaml.load(config_file)
    config_file.close()

    #
    # header
    #
    create_header(dataModel, options)
    #
    # source
    #
    create_source(dataModel, options)
    #
    # Test
    #
    create_test(dataModel, options)


def create_header(dataModel, options):
    factory = AbstractFactory.get_factory('AdtHeader')
    f = factory.get_ball(dataModel)
    if options.write_files:
        f.save()
    else:
        f.put()


def create_source(dataModel, options):
    factory = AbstractFactory.get_factory('AdtSource')
    f = factory.get_ball(dataModel)
    if options.write_files:
        f.save()
    else:
        f.put()


def create_test(dataModel, options):
    factory = AbstractFactory.get_factory('AdtTest')
    f = factory.get_ball(dataModel)
    if options.write_files:
        f.save()
    else:
        f.put()


if __name__ == '__main__':
    main()

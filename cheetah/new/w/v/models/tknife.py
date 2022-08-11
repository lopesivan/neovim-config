from .factory import Factory


class TKnife(Factory):
    def __init__(self, data_model, template_name):

        Factory.__init__(self, template_name)

        self.data_model = data_model

        self.tmpl.name = "knife"

        self.tmpl.log = data_model['log']
        self.tmpl.validation = data_model['validation']
        self.tmpl.etc = data_model['chef_conf_dir']
        self.tmpl.var = data_model['chef_path']
        self.tmpl.chef = data_model['chef']
        self.tmpl.certs = data_model['trusted_certs_dir']

    def put(self):
        fileName = "%s.rb" % self.tmpl.name
        print ("File: %s" % fileName)
        print self.tmpl

    def save(self):
        fileName = "%s.rb" % self.tmpl.name
        print ("Save File: %s" % fileName)
        open(fileName, 'w').write(str(self.tmpl))

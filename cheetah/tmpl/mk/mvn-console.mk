DomainName = www.42algoritmos.com.br
package    =$(shell echo $(DomainName)| sed 's/www.\([^.]\+\).\([^.]\+\).\([^.]\+\)/\3.\2._\1/')
project    = $(NAME)

JAVA_HOME           = /usr/lib/jvm/java-8-oracle/
ARCHETYPEGROUPID    = project._42algoritmos
ARCHETYPEARTIFACTID = console-app-archetype
ARCHETYPEVERSION    = 1.0.2
INTERACTIVEMODE     = false

all: getting-started-with-maven-java-webapp

getting-started-with-maven-java-webapp :$(project)

$(project):
	JAVA_HOME=$(JAVA_HOME) mvn archetype:generate -DgroupId=$(package) -DartifactId=$(project) -DarchetypeGroupId=$(ARCHETYPEGROUPID) -DarchetypeArtifactId=$(ARCHETYPEARTIFACTID) -DarchetypeVersion=$(ARCHETYPEVERSION) -DinteractiveMode=$(INTERACTIVEMODE)

package:
	(cd $(project); JAVA_HOME=$(JAVA_HOME) mvn $@)
compile:
	(cd $(project); JAVA_HOME=$(JAVA_HOME) mvn $@)
test:
	(cd $(project); JAVA_HOME=$(JAVA_HOME) mvn $@)
clean:
	(cd $(project); JAVA_HOME=$(JAVA_HOME) mvn $@)
run:
	(cd $(project); JAVA_HOME=$(JAVA_HOME) mvn exec:java -Dexec.mainClass="$(package).App")

clean-project:
	rm -rf $(project)


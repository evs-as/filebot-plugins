FROM armhf/openjdk:openjdk-8-jre

MAINTAINER Reinhard Pointner <rednoah@filebot.net>

ENV FILEBOT_VERSION 4.7.9


WORKDIR /usr/share/filebot

RUN apt-get update && apt-get install -y \
    mediainfo \
    libchromaprint-tools \
    file \
    curl \
    inotify-tools \
 && rm -rf /var/lib/apt/lists/*
 
RUN FILEBOT_SHA256=d7aa3f8d9af9a784853cd935e9a0770d743156991c1d9538b3b5f25b2a20b11d \
 && FILEBOT_PACKAGE=filebot_${FILEBOT_VERSION}_armhf.deb \
 && curl -L -O https://downloads.sourceforge.net/project/filebot/filebot/FileBot_$FILEBOT_VERSION/$FILEBOT_PACKAGE \
 && echo "$FILEBOT_SHA256 *$FILEBOT_PACKAGE" | sha256sum --check --strict \
 && dpkg -i $FILEBOT_PACKAGE \
 && rm $FILEBOT_PACKAGE

ENV DOCKER_DATA /data
ENV DOCKER_VOLUME /volume1


ENV HOME $DOCKER_DATA
ENV JAVA_OPTS "-DuseGVFS=false -Djava.net.useSystemProxies=false -Dapplication.deployment=docker -Dapplication.dir=$DOCKER_DATA -Duser.home=$DOCKER_DATA -Djava.io.tmpdir=$DOCKER_DATA/tmp -Djava.util.prefs.PreferencesFactory=net.filebot.util.prefs.FilePreferencesFactory -Dnet.filebot.util.prefs.file=$DOCKER_DATA/prefs.properties"


WORKDIR $DOCKER_DATA

VOLUME ["$DOCKER_DATA", "$DOCKER_VOLUME"]

ENTRYPOINT ["filebot"]

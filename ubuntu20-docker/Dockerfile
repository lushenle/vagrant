# Docker image to use with Vagrant
# Adds SSH daemon, Systemd
FROM ubuntu:20.04
LABEL "maintainer"="Shenle Lu <lushenle@gmail.com>"
LABEL "org.opencontainers.image.authors"="Shenle Lu <lushenle@gmail.com>"
LABEL "org.opencontainers.image.vendor"="Shenle Lu"
LABEL "org.opencontainers.image.ref.name"="ubuntu 20.4"
LABEL "org.opencontainers.image.title"="ubuntu 20.4"
LABEL "org.opencontainers.image.description"="ubuntu 20.4 for vagrant"

ENV container docker
RUN apt update && apt dist-upgrade -y

# Install system dependencies, you may not need all of these
RUN apt install -y --no-install-recommends ssh sudo libffi-dev systemd openssh-client

# Add vagrant user and key for SSH
RUN useradd --create-home -s /bin/bash vagrant
RUN echo -n 'vagrant:vagrant' | chpasswd \
    && echo 'vagrant ALL = NOPASSWD: ALL' > /etc/sudoers.d/vagrant \
	&& chmod 440 /etc/sudoers.d/vagrant \
	&& mkdir -p /home/vagrant/.ssh \
	&& chmod 700 /home/vagrant/.ssh \
	&& echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCoc5j97eTfqIJcsTxqyGd8HU5VDIkxuD0P2kueZH62IeX7oOSQ3hAMWMDR219GJStu30Y1bv6b1MEmYxDmTTGgbWYH/AvDeAXUBfmAMR/+IiqNRNsSph4Ny04KYc+qL+PZLYnhUMlQJCB8Q7FkQUMGUKrZYfxvy1HLbsNsNojlz/gwMuJ6prPivvO7xNo88hqr44QWIMwtNPtFg1PRiz2VfMJbdCDL0O4RommqlZnFB0d8KTvm4FqawhNZqhNTcQfgIoTP5DVE2JXHdTE6cXXHHIqEji78AFD+3yeHvFx/VVJRsT5T/GTk4DsKoBXzN+vzQdSUBxQZ/t0QHp8X1fVt shenlel@localhost" > /home/vagrant/.ssh/authorized_keys \
	&& chmod 600 /home/vagrant/.ssh/authorized_keys \
	&& chown -R vagrant:vagrant /home/vagrant/.ssh \
	&& sed -i -e 's/Defaults.*requiretty/#&/' /etc/sudoers \
	&& sed -i -e 's/\(UsePAM \)yes/\1 no/' /etc/ssh/sshd_config

# Start SSH
RUN mkdir /var/run/sshd
EXPOSE 22
RUN /usr/sbin/sshd

# Start Systemd (systemctl)
#CMD ["/lib/systemd/systemd"]
CMD ["/usr/sbin/sshd", "-D"]


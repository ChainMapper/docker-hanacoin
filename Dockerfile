FROM chainmapper/walletbase-bionic

ENV WALLET_URL=https://github.com/hanacoinproject/hanacoin/releases/download/v0.16.4.1/hanacoin-bin-x86_64-linux-gnu.tar.gz

RUN wget $WALLET_URL -O /tmp/wallet.tar.gz \
	&& cd /usr/local/bin \
	&& tar zxvf /tmp/wallet.tar.gz  --strip-components 2

#rpc port & zmqport
EXPOSE 6666 5555

ENV HOME /data

COPY start.sh /start.sh
COPY gen_config.sh /gen_config.sh
COPY wallet.sh /wallet.sh
RUN chmod 777 /*.sh
CMD /start.sh hanacoin.conf HANA hanacoind
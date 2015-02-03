
insert ignore into dbopenfire.ofID (idType, id) VALUES (18, 1);

insert ignore into dbopenfire.ofID (idType, id) VALUES (19, 1);

insert ignore into dbopenfire.ofID (idType, id) VALUES (23, 1);

insert ignore into dbopenfire.ofID (idType, id) VALUES (26, 2);

insert ignore into dbopenfire.ofMucService (serviceID, subdomain, description, isHidden) VALUES (1, N'conference', NULL, 0);

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'admin.authorizedJIDs', N'admin@2kkd71j1.xchangecore.dom');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'ldap.adminDN', N'cn=Directory Manager');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'ldap.adminPassword', N'xc.1549');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'ldap.autoFollowAliasReferrals', N'true');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'ldap.autoFollowReferrals', N'false');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'ldap.baseDN', N'dc=uicds,dc=us');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'ldap.connectionPoolEnabled', N'true');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'ldap.debugEnabled', N'false');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'ldap.emailField', N'mail');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'ldap.encloseDNs', N'true');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'ldap.groupDescriptionField', N'description');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'ldap.groupMemberField', N'uniqueMember');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'ldap.groupNameField', N'cn');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'ldap.groupSearchFilter', N'(&(cn={0})(objectClass=groupOfUniqueNames))');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'ldap.host', N'127.0.0.1');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'ldap.ldapDebugEnabled', N'false');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'ldap.nameField', N'cn');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'ldap.override.avatar', N'false');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'ldap.port', N'636');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'ldap.posixMode', N'false');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'ldap.searchFilter', N'(&(cn={0})(objectClass=inetOrgPerson))');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'ldap.sslEnabled', N'true');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'ldap.usernameField', N'cn');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'ldap.vcard-mapping', N'<!CDATA
<vCard xmlns="vcard-temp">
  <N>
    <GIVEN>{cn}</GIVEN>
  </N> 
  <EMAIL>
    <INTERNET/> 
    <USERID>{mail}</USERID>
  </EMAIL> 
  <FN>{displayName}</FN> 
  <NICKNAME>{uid}</NICKNAME> 
  <PHOTO>
    <TYPE>image/jpeg</TYPE> 
    <BINVAL>{jpegPhoto}</BINVAL>
  </PHOTO> 
  <ADR>
    <HOME/> 
    <STREET>{homePostalAddress}</STREET>
  </ADR> 
  <ADR>
    <WORK/> 
    <STREET>{postalAddress}</STREET> 
    <LOCALITY>{l}</LOCALITY> 
    <REGION>{st}</REGION> 
    <PCODE>{postalCode}</PCODE>
  </ADR> 
  <TEL>
    <HOME/> 
    <VOICE/> 
    <NUMBER>{homePhone}</NUMBER>
  </TEL> 
  <TEL>
    <WORK/> 
    <VOICE/> 
    <NUMBER>{telephoneNumber}</NUMBER>
  </TEL> 
  <TEL>
    <WORK/> 
    <CELL/> 
    <NUMBER>{mobile}</NUMBER>
  </TEL> 
  <TEL>
    <WORK/> 
    <PAGER/> 
    <NUMBER>{pager}</NUMBER>
  </TEL> 
  <TITLE>{title}</TITLE> 
  <ORG>
    <ORGUNIT>{departmentNumber}</ORGUNIT>
  </ORG>
</vCard>>');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'provider.auth.className', N'org.jivesoftware.openfire.ldap.LdapAuthProvider');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'provider.group.className', N'org.jivesoftware.openfire.ldap.LdapGroupProvider');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'provider.user.className', N'org.jivesoftware.openfire.ldap.LdapUserProvider');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'provider.vcard.className', N'org.jivesoftware.openfire.ldap.LdapVCardProvider');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'update.lastCheck', N'1382981939966');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'xmpp.auth.anonymous', N'false');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'xmpp.domain', N'2kkd71j1.xchangecore.dom');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'xmpp.server.certificate.accept-selfsigned', N'true');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'xmpp.server.dialback.enabled', N'false');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'xmpp.server.tls.enabled', N'true');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'xmpp.session.conflict-limit', N'0');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'xmpp.socket.ssl.active', N'true');

insert ignore into dbopenfire.ofProperty (name, propValue) VALUES (N'xmpp.socket.ssl.keypass', N'xc.1549');

insert ignore into dbopenfire.ofPubsubAffiliation (serviceID, nodeID, jid, affiliation) VALUES (N'pubsub', N'', N'2kkd71j1.xchangecore.dom', N'owner');

insert ignore into dbopenfire.ofPubsubDefaultConf (serviceID, leaf, deliverPayloads, maxPayloadSize, persistItems, maxItems, notifyConfigChanges, notifyDelete, notifyRetract, presenceBased, sendItemSubscribe, publisherModel, subscriptionEnabled, accessModel, language, replyPolicy, associationPolicy, maxLeafNodes) VALUES (N'pubsub', 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, N'publishers', 1, N'open', N'English', NULL, N'all', -1);

insert ignore into dbopenfire.ofPubsubDefaultConf (serviceID, leaf, deliverPayloads, maxPayloadSize, persistItems, maxItems, notifyConfigChanges, notifyDelete, notifyRetract, presenceBased, sendItemSubscribe, publisherModel, subscriptionEnabled, accessModel, language, replyPolicy, associationPolicy, maxLeafNodes) VALUES (N'pubsub', 1, 1, 5120, 0, -1, 1, 1, 1, 0, 1, N'publishers', 1, N'open', N'English', NULL, N'all', -1);

insert ignore into dbopenfire.ofPubsubNode (serviceID, nodeID, leaf, creationDate, modificationDate, parent, deliverPayloads, maxPayloadSize, persistItems, maxItems, notifyConfigChanges, notifyDelete, notifyRetract, presenceBased, sendItemSubscribe, publisherModel, subscriptionEnabled, configSubscription, accessModel, payloadType, bodyXSLT, dataformXSLT, creator, description, language, name, replyPolicy, associationPolicy, maxLeafNodes) VALUES (N'pubsub', N'', 0, N'001382981904332', N'001382981904332', NULL, 0, 0, 0, 0, 1, 1, 1, 0, 0, N'publishers', 1, 0, N'open', N'', N'', N'', N'2kkd71j1.xchangecore.dom', N'', N'English', N'', NULL, N'all', -1);

insert ignore into dbopenfire.ofPubsubSubscription (serviceID, nodeID, id, jid, owner, state, deliver, digest, digest_frequency, expire, includeBody, showValues, subscriptionType, subscriptionDepth, keyword) VALUES (N'pubsub', N'', N'zeKBCe2yL1M3kLf3X0AKIN2HBmpzaxpeQ5SAGolD', N'2kkd71j1.xchangecore.dom', N'2kkd71j1.xchangecore.dom', N'subscribed', 1, 0, 86400000, NULL, 0, N' ', N'nodes', 1, NULL);

insert ignore into dbopenfire.ofUser (username, plainPassword, encryptedPassword, name, email, creationDate, modificationDate) VALUES (N'admin', N'xc.1549', NULL, N'Administrator', N'admin@2kkd71j1.xchangecore.dom', N'0              ', N'0              ');

insert ignore into dbopenfire.ofVersion (name, version) VALUES (N'openfire', 21);


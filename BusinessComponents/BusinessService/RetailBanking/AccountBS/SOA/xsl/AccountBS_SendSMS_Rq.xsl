<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:tns="http://xmlns.equitybank.co.ke/ESB/EO/Misc/Notification/V1"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ns0="http://xmlns.equitybank.co.ke/ESB/BO/RetailBanking/Account/V1"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd ns0 tns xp20 oraxsl mhdr oraext dvm xref socket"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:bio="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1"
                xmlns:custeo="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"
                xmlns:ns1="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="oramds:/apps/ESBMetadata/ComponentLibrary/BusinessServices/RetailBanking/Account/V1/AccountBO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/BO/RetailBanking/Account/V1"/>
        <oracle-xsl-mapper:param name="accountOpeningDO"/>
      </oracle-xsl-mapper:source>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="oramds:/apps/ESBMetadata/ComponentLibrary/BusinessServices/RetailBanking/Account/V1/AccountBO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/BO/RetailBanking/Account/V1"/>
        <oracle-xsl-mapper:param name="accountOpeningRespDO"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="oramds:/apps/ESBMetadata/ComponentLibrary/EnterpriseObjects/Misc/Notification/V1/NotificationEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Misc/Notification/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [MON MAY 18 10:50:51 EAT 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:param name="accountOpeningRespDO"/>
  <xsl:template match="/">
    <tns:ESBMsg>
      <tns:RqData>
        <tns:Notification>
          <tns:ToMobileNumber>
            <xsl:value-of select='concat ("+", $accountOpeningRespDO/ns0:ESBMsg/ns0:RsData/custeo:Customer/com:Phone/com:CompleteNumber/text())'/>
            <!--xsl:value-of select='concat ("+", /ns0:ESBMsg/ns0:RqData/custeo:Customer/com:Phone/com:CountryCode, /ns0:ESBMsg/ns0:RqData/custeo:Customer/com:Phone/com:LocalNumber )'/-->
          </tns:ToMobileNumber>
          <tns:Subject></tns:Subject>
          <xsl:variable name="property" select="."/>
          <xsl:variable name="delimiter" select="';'"/>
          <tns:Body>
            <xsl:value-of select='concat ("Congratulations, your account(s) created successfully, your account number(s) : ", " ")'/>
            <xsl:for-each select="$accountOpeningRespDO/ns0:ESBMsg/ns0:RsData/eo:Account/com:AccountIdentifier/com:AccountID">
             <xsl:if test="./text()!=''">
              <!--<xsl:value-of select="."/>,-->
              <xsl:value-of select='.'/>
              <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
              </xsl:if>
              </xsl:if>
            </xsl:for-each>
          </tns:Body>
          <!--<tns:Body>
            <xsl:value-of select='concat ($accountOpeningRespDO/ns0:ESBMsg/ns0:RsData/custeo:Customer/com:CustomerIdentifier/com:CustomerID, "-", $accountOpeningRespDO/ns0:ESBMsg/ns0:RsData/eo:Account/com:AccountIdentifier/com:AccountID, "-", $accountOpeningRespDO/ns0:ESBMsg/ns0:RsData/eo:Account/eo:AccountType )'/>
          </tns:Body>-->
        </tns:Notification>
      </tns:RqData>
    </tns:ESBMsg>
  </xsl:template>
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:ns0="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl ns0 oraxsl xp20 xref mhdr oraext dvm socket"
                xmlns:ns4="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1"
                xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/"
                xmlns:ns1="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:es="http://xmlns.equitybank.co.ke/ESB/ES/Accounts/Account/V1"
                xmlns:ns3="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"
                xmlns:ns2="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="oramds:/apps/ESBMetadata/ComponentLibrary/EnterpriseServices/Accounts/Account/V1/AccountES.wsdl"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"/>
      </oracle-xsl-mapper:source>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="oramds:/apps/ESBMetadata/ComponentLibrary/EnterpriseServices/Accounts/Account/V1/AccountES.wsdl"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"/>
        <oracle-xsl-mapper:param name="AccountBalanceResponse.payload"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="WSDL">
        <oracle-xsl-mapper:schema location="oramds:/apps/ESBMetadata/ComponentLibrary/EnterpriseServices/Accounts/Account/V1/AccountES.wsdl"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [TUE JUL 28 17:36:35 EAT 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:param name="AccountBalanceResponse.payload"/>
  <xsl:template match="/">
    <ns0:ESBMsg>
      <ns0:RqData/>
      <ns0:RsData>
        <xsl:for-each select="/ns0:ESBMsg/ns0:RsData/ns0:Account">
          <xsl:variable name="tmpAcctID" select="ns1:AccountIdentifier/ns1:AccountID"/>
          <xsl:variable name="AccountType" select="ns0:AccountType"/>
          <xsl:variable name="AccountSubType" select="ns0:AccountSubType"/>
          <xsl:variable name="AccountOpenDate" select="ns0:AccountOpenDate"/>
          <xsl:variable name="AccountClosureFlag" select="ns0:AccountClosureFlag"/>
          <xsl:variable name="FullName" select="ns3:Customer/ns1:Person/ns1:PersonName/ns1:FullName"/>
          <xsl:variable name="AccountOwnership" select="ns0:AccountOwnership"/>
          <xsl:variable name="AccountStatus" select="ns0:AccountStatus"/>
          <xsl:for-each select="$AccountBalanceResponse.payload/ns0:ESBMsg/ns0:RsData/ns0:Account">
            <test>
              <xsl:value-of select="concat(ns1:AccountIdentifier/ns1:AccountID,$tmpAcctID)"/>
            </test>
            <xsl:if test="ns1:AccountIdentifier/ns1:AccountID/text() !='' or $tmpAcctID/text() !=''">
              <xsl:choose>
                <xsl:when test="ns1:AccountIdentifier/ns1:AccountID = $tmpAcctID">
                  <ns0:Account>
                    <ns1:AccountIdentifier>
                      <ns1:BankID>
                        <xsl:value-of select="ns1:AccountIdentifier/ns1:BankID"/>
                      </ns1:BankID>
                      <ns1:AccountID>
                        <xsl:value-of select="ns1:AccountIdentifier/ns1:AccountID"/>
                      </ns1:AccountID>
                      <ns1:AccountCurrency>
                        <xsl:value-of select="ns1:AccountIdentifier/ns1:AccountCurrency"/>
                      </ns1:AccountCurrency>
                    </ns1:AccountIdentifier>
                    <ns0:AccountType>
                      <xsl:value-of select="$AccountType"/>
                    </ns0:AccountType>
                    <ns0:AccountSubType>
                      <xsl:value-of select="$AccountSubType"/>
                    </ns0:AccountSubType>
                    <ns0:AccountOpenDate>
                      <xsl:value-of select="$AccountOpenDate"/>
                    </ns0:AccountOpenDate>
                    <ns0:AccountOwnership>
                      <xsl:value-of select="$AccountOwnership"/>
                    </ns0:AccountOwnership>
                    <ns3:Customer>
                      <ns1:Person>
                        <ns1:PersonName>
                          <ns1:FullName>
                            <xsl:value-of select="$FullName"/>
                          </ns1:FullName>
                        </ns1:PersonName>
                      </ns1:Person>
                    </ns3:Customer>
                    <xsl:for-each select="ns1:Balance">
                      <ns1:Balance>
                        <ns1:BalanceType>
                          <xsl:value-of select="ns1:BalanceType"/>
                        </ns1:BalanceType>
                        <ns1:BalanceAmount currencyCode="{ns1:BalanceAmount/@currencyCode}">
                          <xsl:value-of select="ns1:BalanceAmount"/>
                        </ns1:BalanceAmount>
                      </ns1:Balance>
                    </xsl:for-each>
                    <ns0:AccountClosureFlag>
                      <xsl:value-of select="$AccountClosureFlag"/>
                    </ns0:AccountClosureFlag>
                    <ns0:AccountStatus>
                      <xsl:value-of select="$AccountStatus"/>
                    </ns0:AccountStatus>
                  </ns0:Account>
                </xsl:when>
              </xsl:choose>
            </xsl:if>
          </xsl:for-each>
        </xsl:for-each>
        <xsl:if test="/ns0:ESBMsg/ns0:RsData/ns1:Status">
          <ns1:Status>
            <xsl:if test="/ns0:ESBMsg/ns0:RsData/ns1:Status/ns1:Code">
              <ns1:Code>
                <xsl:value-of select="/ns0:ESBMsg/ns0:RsData/ns1:Status/ns1:Code"/>
              </ns1:Code>
            </xsl:if>
            <xsl:if test="/ns0:ESBMsg/ns0:RsData/ns1:Status/ns1:Type">
              <ns1:Type>
                <xsl:value-of select="/ns0:ESBMsg/ns0:RsData/ns1:Status/ns1:Type"/>
              </ns1:Type>
            </xsl:if>
            <xsl:if test="/ns0:ESBMsg/ns0:RsData/ns1:Status/ns1:Text">
              <ns1:Text>
                <xsl:value-of select="/ns0:ESBMsg/ns0:RsData/ns1:Status/ns1:Text"/>
              </ns1:Text>
            </xsl:if>
          </ns1:Status>
        </xsl:if>
      </ns0:RsData>
    </ns0:ESBMsg>
  </xsl:template>
</xsl:stylesheet>
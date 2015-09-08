<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"
                xmlns:rs="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Account/V1"
                xmlns:rcom="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Common/V1"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl eo com rs rcom oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:custeo="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"
                xmlns:ns0="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1">
  <oracle-xsl-mapper:schema>
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/RequesterServices/Polaris/Account/V1/AccountRO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Account/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Accounts/Account/V1/AccountEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
  </oracle-xsl-mapper:schema>
  <xsl:template match="/">
    <eo:ESBMsg>
      <com:MsgID>
        <xsl:value-of select="/rs:ESBMsg/rcom:MsgID"/>
      </com:MsgID>
      <com:Source>COR</com:Source>
      <com:MsgType>Requester</com:MsgType>
      <com:Service>AccountES</com:Service>
      <xsl:if test="/rs:ESBMsg/rs:RqData">
        <eo:RqData actionCode="QueryRetailAccountStatusByID">
          <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Account/self::node()">
            <eo:Account>
              <xsl:for-each select="/rs:ESBMsg/rs:RqData/rs:Account/com:AccountIdentifier"/>
              <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Account/com:AccountIdentifier">
                <com:AccountIdentifier>
                  <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Account/com:AccountIdentifier/com:BankID">
                    <com:BankID>
                      <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Account/com:AccountIdentifier/com:BankID"/>
                    </com:BankID>
                  </xsl:if>
                  <xsl:if test="/rs:ESBMsg/rs:RqData/rs:Account/com:AccountIdentifier/com:AccountID">
                    <com:AccountID>
                      <xsl:value-of select="/rs:ESBMsg/rs:RqData/rs:Account/com:AccountIdentifier/com:AccountID"/>
                    </com:AccountID>
                  </xsl:if>
                </com:AccountIdentifier>
              </xsl:if>
            </eo:Account>
          </xsl:if>
        </eo:RqData>
      </xsl:if>
    </eo:ESBMsg>
  </xsl:template>
</xsl:stylesheet>

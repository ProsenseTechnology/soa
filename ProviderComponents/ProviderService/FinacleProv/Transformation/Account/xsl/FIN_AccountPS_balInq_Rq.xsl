<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:fn="http://www.w3.org/2005/xpath-functions"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:app="http://www.finacle.com/fixml" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="fn xsd xsi oracle-xsl-mapper xsl app eo com oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:custeo="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"
                xmlns:bio="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1"
                xmlns:fileo="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1">
  <oracle-xsl-mapper:schema>
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Accounts/Account/V1/AccountEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/ProviderServices/Finacle/AppMetadata/xsds/FIXML.xsd"/>
        <oracle-xsl-mapper:rootElement name="FIXML" namespace="http://www.finacle.com/fixml"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
  </oracle-xsl-mapper:schema>
  <xsl:param name="date"/>
  <xsl:param name="index"/>
  <xsl:template match="/">
    <app:FIXML schemalocation="http://www.finacle.com/fixml">
      <app:Header>
        <app:RequestHeader>
          <app:MessageKey>
            <app:RequestUUID>
              <xsl:value-of select="/eo:ESBMsg/com:MsgID"/>
            </app:RequestUUID>
            <app:ServiceRequestId>BalInq</app:ServiceRequestId>
            <app:ServiceRequestVersion>10.2</app:ServiceRequestVersion>
            <app:ChannelId>
              <xsl:value-of select="/eo:ESBMsg/com:Source"/>
            </app:ChannelId>
            <app:LanguageId></app:LanguageId>
          </app:MessageKey>
          <app:RequestMessageInfo>
            <app:BankId>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Account[number($index)]/com:AccountIdentifier/com:BankID"/>
            </app:BankId>
            <app:TimeZone></app:TimeZone>
            <app:EntityId></app:EntityId>
            <app:EntityType></app:EntityType>
            <app:ArmCorrelationId></app:ArmCorrelationId>
            <app:MessageDateTime>
              <xsl:value-of select="$date"/>
            </app:MessageDateTime>
          </app:RequestMessageInfo>
          <app:Security>
            <app:Token>
              <app:PasswordToken>
                <app:UserId></app:UserId>
                <app:Password></app:Password>
              </app:PasswordToken>
            </app:Token>
            <app:FICertToken></app:FICertToken>
            <app:RealUserLoginSessionId></app:RealUserLoginSessionId>
            <app:RealUser></app:RealUser>
            <app:RealUserPwd></app:RealUserPwd>
            <app:SSOTransferToken></app:SSOTransferToken>
          </app:Security>
        </app:RequestHeader>
      </app:Header>
      <app:Body>
        <app:BalInqRequest>
          <app:BalInqRq>
            <app:AcctId>
              <app:AcctId>
                <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Account[number($index)]/com:AccountIdentifier/com:AccountID"/>
              </app:AcctId>
            </app:AcctId>
          </app:BalInqRq>
        </app:BalInqRequest>
      </app:Body>
    </app:FIXML>
  </xsl:template>
</xsl:stylesheet>

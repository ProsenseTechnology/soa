<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:app="http://www.finacle.com/fixml" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl app eo com oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:acceo="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"
                xmlns:ns0="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1">
  <oracle-xsl-mapper:schema>
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Parties/Customer/V1/CustomerEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"/>
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
  <xsl:template match="/">
    <app:FIXML schemalocation="http://www.finacle.com/fixml">
      <app:Header>
        <app:RequestHeader>
          <app:MessageKey>
            <app:RequestUUID>
              <xsl:value-of select="/eo:ESBMsg/com:MsgID"/>
            </app:RequestUUID>
            <app:ServiceRequestId>executeFinacleScript</app:ServiceRequestId>
            <app:ServiceRequestVersion>10.2</app:ServiceRequestVersion>
            <app:ChannelId>
            <xsl:value-of select="/eo:ESBMsg/com:Source"/>
            </app:ChannelId>
            <app:LanguageId/>
          </app:MessageKey>
          <app:RequestMessageInfo>
            <app:BankId>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Customer/com:CustomerIdentifier/com:BankID"/>
            </app:BankId>
            <app:TimeZone/>
            <app:EntityId/>
            <app:EntityType/>
            <app:ArmCorrelationId/>
            <app:MessageDateTime>
              <xsl:value-of select="$date"/>
            </app:MessageDateTime>
          </app:RequestMessageInfo>
          <app:Security>
            <app:Token>
              <app:PasswordToken>
                <app:UserId/>
                <app:Password/>
              </app:PasswordToken>
            </app:Token>
            <app:FICertToken/>
            <app:RealUserLoginSessionId/>
            <app:RealUser/>
            <app:RealUserPwd/>
            <app:SSOTransferToken/>
          </app:Security>
        </app:RequestHeader>
      </app:Header>
      <app:Body>
        <app:executeFinacleScriptRequest>
          <app:ExecuteFinacleScriptInputVO>
            <app:requestId>cust_onboard.scr</app:requestId>
          </app:ExecuteFinacleScriptInputVO>
          <app:executeFinacleScript_CustomData>
            <app:cifid>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Customer/com:CustomerIdentifier/com:CustomerID"/>
            </app:cifid>
          </app:executeFinacleScript_CustomData>
        </app:executeFinacleScriptRequest>
      </app:Body>
    </app:FIXML>
  </xsl:template>
</xsl:stylesheet>

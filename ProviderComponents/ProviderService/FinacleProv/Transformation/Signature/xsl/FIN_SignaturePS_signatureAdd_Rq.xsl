<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:app="http://www.finacle.com/fixml" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Signature/V1"
                xmlns:acc="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"
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
                xmlns:ns1="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"
                xmlns:ns0="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1"
                xmlns:ns2="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1">
  <oracle-xsl-mapper:schema>
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Resilience/Signature/V1/SignatureEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Signature/V1"/>
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
    <FIXML xmlns="http://www.finacle.com/fixml" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
      <Header>
        <RequestHeader>
          <MessageKey>
            <RequestUUID>
              <xsl:value-of select="/eo:ESBMsg/com:MsgID"/>
            </RequestUUID>
            <ServiceRequestId>SignatureAdd</ServiceRequestId>
            <ServiceRequestVersion>10.2</ServiceRequestVersion>
            <ChannelId>
              <xsl:value-of select="/eo:ESBMsg/com:Source"/>
            </ChannelId>
            <LanguageId/>
          </MessageKey>
          <RequestMessageInfo>
            <BankId>54</BankId>
            <TimeZone/>
            <EntityId/>
            <EntityType/>
            <ArmCorrelationId/>
            <MessageDateTime>
              <xsl:value-of select="$date"/>
            </MessageDateTime>
          </RequestMessageInfo>
          <Security>
            <Token>
              <PasswordToken>
                <UserId/>
                <Password/>
              </PasswordToken>
            </Token>
            <FICertToken/>
            <RealUserLoginSessionId/>
            <RealUser/>
            <RealUserPwd/>
            <SSOTransferToken/>
          </Security>
        </RequestHeader>
      </Header>
      <Body>
        <SignatureAddRequest>
          <SignatureAddRq>
            <AcctId>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Signature/acc:Account/com:AccountIdentifier/com:AccountID"/>
            </AcctId>
            <AcctCode>N</AcctCode>
            <BankCode>068</BankCode>
            <SigPowerNum>1</SigPowerNum>
            <BankId>54</BankId>
            <ImageAccessCode>AL</ImageAccessCode>
            <SigExpDt>2050-02-13T00:00:00.000</SigExpDt>
            <SigEffDt>
              <xsl:value-of select="$date"/>
            </SigEffDt>
            <SigFile>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Signature/acc:Account/ns1:Customer/com:Person/com:SignatureImage"/>
            </SigFile>
            <PictureExpDt>2050-02-13T00:00:00.000</PictureExpDt>
            <PictureEffDt>
              <xsl:value-of select="$date"/>
            </PictureEffDt>
            <PictureFile>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Signature/acc:Account/ns1:Customer/com:Person/com:IdentityDocument/com:DocImage1"/>
            </PictureFile>
            <SigGrpId>GEO</SigGrpId>
          </SignatureAddRq>
        </SignatureAddRequest>
      </Body>
    </FIXML>
  </xsl:template>
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
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
                xmlns:ns0="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1"
                xmlns:ns1="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1">
  <oracle-xsl-mapper:schema>
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/ProviderServices/Finacle/AppMetadata/xsds/FIXML.xsd"/>
        <oracle-xsl-mapper:rootElement name="FIXML" namespace="http://www.finacle.com/fixml"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Parties/Customer/V1/CustomerEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
  </oracle-xsl-mapper:schema>
  <xsl:template match="/">
    <eo:ESBMsg>
      <com:MsgID>
        <xsl:value-of select="/app:FIXML/app:Header/app:ResponseHeader/app:RequestMessageKey/app:RequestUUID"/>
      </com:MsgID>
      <eo:RsData>
        <eo:Customer>
          <com:CustomerIdentifier>
            <com:BankID>
              <xsl:value-of select="/app:FIXML/app:Header/app:ResponseHeader/app:ResponseMessageInfo/app:BankId"/>
            </com:BankID>
          </com:CustomerIdentifier>
        </eo:Customer>
        <com:Status>
          <xsl:choose>
            <xsl:when test="/app:FIXML/app:Body/app:executeFinacleScriptResponse/app:executeFinacleScript_CustomData/app:ONBOARDEDSTATUS = 'Y'">
              <com:Code>ESB-00</com:Code>
              <com:Type>Success</com:Type>
              <com:Text>Customer onboarded successfully</com:Text>
            </xsl:when>
            <xsl:when test="/app:FIXML/app:Body/app:executeFinacleScriptResponse/app:executeFinacleScript_CustomData/app:ONBOARDEDSTATUS = 'N'">
              <com:Code>ESB-00</com:Code>
              <com:Type>Success</com:Type>
              <com:Text>Customer de-onboarded successfully</com:Text>
            </xsl:when>
            <xsl:when test="/app:FIXML/app:Body/app:Error/app:FISystemException/app:ErrorDetail/app:ErrorCode">
              <com:Code>
                <xsl:value-of select='DVMFunctions:lookupValue ("ESBMetadata/DVM/ESB_STATUS_CODES", "FinacleCode", /app:FIXML/app:Body/app:Error/app:FISystemException/app:ErrorDetail/app:ErrorCode, "ESBCode", "")'/>
              </com:Code>
              <com:Type>
                <xsl:value-of select='DVMFunctions:lookupValue ("ESBMetadata/DVM/ESB_STATUS_CODES", "FinacleCode", /app:FIXML/app:Body/app:Error/app:FISystemException/app:ErrorDetail/app:ErrorCode, "ESBType", "")'/>
              </com:Type>
              <com:Text>
                <xsl:value-of select='DVMFunctions:lookupValue ("ESBMetadata/DVM/ESB_STATUS_CODES", "FinacleCode", /app:FIXML/app:Body/app:Error/app:FISystemException/app:ErrorDetail/app:ErrorCode, "ESBText", "")'/>
              </com:Text>
            </xsl:when>
            <xsl:when test="/app:FIXML/app:Body/app:executeFinacleScriptResponse/app:executeFinacleScript_CustomData/app:Error">
              <com:Code>
                <xsl:value-of select='DVMFunctions:lookupValue ("ESBMetadata/DVM/ESB_STATUS_CODES", "FinacleCode", /app:FIXML/app:Body/app:executeFinacleScriptResponse/app:executeFinacleScript_CustomData/app:Error, "ESBCode", "")'/>
              </com:Code>
              <com:Type>
                <xsl:value-of select='DVMFunctions:lookupValue ("ESBMetadata/DVM/ESB_STATUS_CODES", "FinacleCode", /app:FIXML/app:Body/app:executeFinacleScriptResponse/app:executeFinacleScript_CustomData/app:Error, "ESBType", "")'/>
              </com:Type>
              <com:Text>
                <xsl:value-of select='DVMFunctions:lookupValue ("ESBMetadata/DVM/ESB_STATUS_CODES", "FinacleCode", /app:FIXML/app:Body/app:executeFinacleScriptResponse/app:executeFinacleScript_CustomData/app:Error, "ESBText", "")'/>
              </com:Text>
            </xsl:when>
            <xsl:when test="/app:FIXML/app:Body/app:Error/app:ErrorDetail/app:ErrorCode">
              <com:Code>
                <xsl:value-of select='DVMFunctions:lookupValue ("ESBMetadata/DVM/ESB_STATUS_CODES", "FinacleCode", /app:FIXML/app:Body/app:Error/app:ErrorDetail/app:ErrorCode, "ESBCode", "")'/>
              </com:Code>
              <com:Type>
                <xsl:value-of select='DVMFunctions:lookupValue ("ESBMetadata/DVM/ESB_STATUS_CODES", "FinacleCode", /app:FIXML/app:Body/app:Error/app:ErrorDetail/app:ErrorCode, "ESBType", "")'/>
              </com:Type>
              <com:Text>
                <xsl:value-of select='DVMFunctions:lookupValue ("ESBMetadata/DVM/ESB_STATUS_CODES", "FinacleCode", /app:FIXML/app:Body/app:Error/app:ErrorDetail/app:ErrorCode, "ESBText", "")'/>
              </com:Text>
            </xsl:when>
            <xsl:otherwise>
              <com:Code>
                <xsl:value-of select='DVMFunctions:lookupValue ("ESBMetadata/DVM/ESB_STATUS_CODES", "FinacleCode", /app:FIXML/app:Body/app:executeFinacleScriptResponse/app:executeFinacleScript_CustomData/app:Statusmsg, "ESBCode", "")'/>
              </com:Code>
              <com:Type>
                <xsl:value-of select='DVMFunctions:lookupValue ("ESBMetadata/DVM/ESB_STATUS_CODES", "FinacleCode", /app:FIXML/app:Body/app:executeFinacleScriptResponse/app:executeFinacleScript_CustomData/app:Statusmsg, "ESBType", "")'/>
              </com:Type>
              <com:Text>
                <xsl:value-of select='DVMFunctions:lookupValue ("ESBMetadata/DVM/ESB_STATUS_CODES", "FinacleCode", /app:FIXML/app:Body/app:executeFinacleScriptResponse/app:executeFinacleScript_CustomData/app:Statusmsg, "ESBText", "")'/>
              </com:Text>
            </xsl:otherwise>
          </xsl:choose>
        </com:Status>
      </eo:RsData>
    </eo:ESBMsg>
  </xsl:template>
</xsl:stylesheet>

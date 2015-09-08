<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:app="http://www.finacle.com/fixml" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:v13="http://xmlns.equitybank.co.ke/ESB/EO/Misc/Notification/V1"
                xmlns:v1="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Notification/V1"
                xmlns:v11="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Common/V1"
                xmlns:v12="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl app v13 com oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:custeo="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1">
  <oracle-xsl-mapper:schema>
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Misc/Notification/V1/NotificationEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Misc/Notification/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/RequesterServices/Polaris/Notification/V1/NotificationRO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Notification/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
  </oracle-xsl-mapper:schema>
  <xsl:template match="/">
    <v1:ESBMsg>
      <v11:MsgID>
        <xsl:value-of select="/v13:ESBMsg/v12:MsgID"/>
      </v11:MsgID>
      <xsl:if test="/v13:ESBMsg/v13:RsData">
        <v1:RsData>
          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Notification">
            <v1:Notification>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Notification/v12:NotificationIdentifier">
                <v12:NotificationIdentifier>
                  <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Notification/v12:NotificationIdentifier/v12:NotificationID">
                    <v12:NotificationID>
                      <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Notification/v12:NotificationIdentifier/v12:NotificationID"/>
                    </v12:NotificationID>
                  </xsl:if>
                </v12:NotificationIdentifier>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Notification/v13:NotificationType">
                <v13:NotificationType>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Notification/v13:NotificationType"/>
                </v13:NotificationType>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Notification/v13:FromMobileNumber">
                <v13:FromMobileNumber>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Notification/v13:FromMobileNumber"/>
                </v13:FromMobileNumber>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Notification/v13:ToMobileNumber">
                <v13:ToMobileNumber>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Notification/v13:ToMobileNumber"/>
                </v13:ToMobileNumber>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Notification/v13:FromEmailAddress">
                <v13:FromEmailAddress>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Notification/v13:FromEmailAddress"/>
                </v13:FromEmailAddress>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Notification/v13:ToEmailAddress">
                <v13:ToEmailAddress>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Notification/v13:ToEmailAddress"/>
                </v13:ToEmailAddress>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Notification/v13:Subject">
                <v13:Subject>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Notification/v13:Subject"/>
                </v13:Subject>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Notification/v13:Body">
                <v13:Body>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Notification/v13:Body"/>
                </v13:Body>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Notification/v13:NotificationStatus">
                <v13:NotificationStatus>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Notification/v13:NotificationStatus"/>
                </v13:NotificationStatus>
              </xsl:if>
            </v1:Notification>
          </xsl:if>
          <v12:Status>
            <v12:Code>ESB-00</v12:Code>
            <v12:Type>SUCCESS</v12:Type>
            <v12:Text>Email Initiated Successfully</v12:Text>
          </v12:Status>
        </v1:RsData>
      </xsl:if>
    </v1:ESBMsg>
  </xsl:template>
</xsl:stylesheet>

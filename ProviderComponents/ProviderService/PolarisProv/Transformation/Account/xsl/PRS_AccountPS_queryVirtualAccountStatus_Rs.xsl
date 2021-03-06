<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:ns0="http://listeners.webtools.integrator.polaris.com"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:tns="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl ns0 tns oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:ns1="http://org.apache.axis2/xsd" xmlns:http="http://schemas.xmlsoap.org/wsdl/http/"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:wsaw="http://www.w3.org/2006/05/addressing/wsdl"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:bio="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1"
                xmlns:custeo="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"
                xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/"
                xmlns:ns2="http://schemas.xmlsoap.org/wsdl/soap/">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/ProviderServices/Polaris/AppMetaData/wsdls/Integrator.wsdl"/>
        <oracle-xsl-mapper:rootElement name="processMessageResponse"
                                       namespace="http://listeners.webtools.integrator.polaris.com"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Accounts/Account/V1/AccountEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [FRI JUN 12 15:10:29 IST 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <tns:ESBMsg>
      <com:MsgID>
        <xsl:value-of select="/ns0:processMessageResponse/ns0:return/virtualAccValidationRes/MsgRefNo"/>
      </com:MsgID>
      <com:Source>
        <xsl:value-of select="/ns0:processMessageResponse/ns0:return/virtualAccValidationRes/SystemID"/>
      </com:Source>
      <com:MsgType>Enterprise</com:MsgType>
      <tns:RsData>
        <tns:Account>
          <com:AccountIdentifier>
            <com:BankID>
              <xsl:value-of select="/ns0:processMessageResponse/ns0:return/virtualAccValidationRes/UnitID"/>
            </com:BankID>
          </com:AccountIdentifier>
          <tns:InterfaceCode>
            <xsl:value-of select="/ns0:processMessageResponse/ns0:return/virtualAccValidationRes/InterfaceCode"/>
          </tns:InterfaceCode>
        </tns:Account>
        <xsl:for-each select="/ns0:processMessageResponse/ns0:return/virtualAccValidationRes/virtualAccListRes/virtualAccDetails">
          <tns:Account>
            <com:AccountIdentifier>
              <com:AccountID>
                <xsl:value-of select="VANo"/>
              </com:AccountID>
            </com:AccountIdentifier>
            <tns:AccountType>
              <xsl:value-of select="VAType"/>
            </tns:AccountType>
            <tns:AccountStatus>
              <xsl:value-of select="Status"/>
            </tns:AccountStatus>
            <custeo:Customer>
              <com:CustomerIdentifier>
                <com:CustomerID>
                  <xsl:value-of select="CIFNo"/>
                </com:CustomerID>
              </com:CustomerIdentifier>
            </custeo:Customer>
            <tns:ConsumerReferenceNumber>
              <xsl:value-of select="ConsumerRefNo"/>
            </tns:ConsumerReferenceNumber>
            <tns:OutStanding_Amount>
              <xsl:value-of select="Amount"/>
            </tns:OutStanding_Amount>
            <com:Remarks>
              <xsl:value-of select="Remarks"/>
            </com:Remarks>
          </tns:Account>
          <xsl:choose>
            <xsl:when test="ErrorCode = 'ERR000'">
              <com:Status>
                <com:Code>ESB-00</com:Code>
                <com:Type>Success</com:Type>
                <com:Text>Virtual account queried successfully</com:Text>
              </com:Status>
            </xsl:when>
            <xsl:otherwise>
              <com:Status>
                <com:Code>
                  <xsl:value-of select='DVMFunctions:lookupValue ("ESBMetadata/DVM/ESB_STATUS_CODES","PolarisCode", ErrorCode, "ESBCode", "")'/>
                </com:Code>
                <com:Type>
                  <xsl:value-of select='DVMFunctions:lookupValue ("ESBMetadata/DVM/ESB_STATUS_CODES","PolarisCode", ErrorCode, "ESBType", "")'/>
                </com:Type>
                <com:Text>
                  <xsl:value-of select='DVMFunctions:lookupValue ("ESBMetadata/DVM/ESB_STATUS_CODES", "PolarisCode",ErrorCode, "ESBText", "")'/>
                </com:Text>
              </com:Status>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
      </tns:RsData>
    </tns:ESBMsg>
  </xsl:template>
</xsl:stylesheet>

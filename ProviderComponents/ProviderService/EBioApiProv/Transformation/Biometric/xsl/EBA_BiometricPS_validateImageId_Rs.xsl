<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl eo com oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:empeo="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Employee/V1"
                xmlns:ns0="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/NationalIdentity/V1">
  <oracle-xsl-mapper:schema>
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/ProviderServices/EBioApi/AppMetadata/xsds/EBioApi.xsd"/>
        <oracle-xsl-mapper:rootElement name="response" namespace=""/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Resilience/Biometric/V1/BiometricEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
  </oracle-xsl-mapper:schema>
  <xsl:template match="/">
    <eo:ESBMsg>
      <eo:RsData>
        <eo:Biometric>
          <com:CustomerIdentifier>
            <com:BankID>
              <xsl:value-of select="/response/countryCode"/>
            </com:BankID>
            <com:CustomerID>
              <xsl:value-of select="/response/cifId"/>
            </com:CustomerID>
            <com:BranchID>
              <xsl:value-of select="/response/branchId"/>
            </com:BranchID>
          </com:CustomerIdentifier>
          <empeo:Employee>
            <empeo:WorkClass>
              <xsl:value-of select="/response/workClass"/>
            </empeo:WorkClass>
            <com:FinUserID>
              <xsl:value-of select="/response/userId"/>
            </com:FinUserID>
          </empeo:Employee>
        </eo:Biometric>
        <xsl:choose>
          <xsl:when test="/response/responseCode/text()='00'">
            <com:Status>
              <com:Code>ESB-00</com:Code>
              <com:Type>Success</com:Type>
              <com:Text>Biometric CIF validation for image successfully:<xsl:value-of select="/response/responseMessage"/></com:Text>
            </com:Status>
          </xsl:when>
          <xsl:otherwise>
            <com:Status>
              <com:Code>ESB-100</com:Code>
              <com:Type>Failure</com:Type>
              <com:Text>
                <xsl:value-of select="concat('Biometric CIF validation for image failed. Error: ',/response/responseMessage/text())"/>
              </com:Text>
            </com:Status>
          </xsl:otherwise>
        </xsl:choose>
      </eo:RsData>
    </eo:ESBMsg>
  </xsl:template>
</xsl:stylesheet>
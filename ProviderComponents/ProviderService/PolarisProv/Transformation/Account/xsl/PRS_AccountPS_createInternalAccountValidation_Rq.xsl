<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:ns0="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:tns="http://xmlns.equitybank.co.ke/ESB/PS/Polaris/Adapter/ftp"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd ns0 tns oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:fileo="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:bio="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1"
                xmlns:custeo="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"
                xmlns:nxsd="http://xmlns.oracle.com/pcbpel/nxsd">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Accounts/Account/V1/AccountEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../Adapter/ftp/PRS_FTP_Adapter.xsd"/>
        <oracle-xsl-mapper:rootElement name="InternalAccountValidationRespFileInput"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/PS/Polaris/Adapter/ftp"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [TUE JUN 30 09:45:27 EAT 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <tns:InternalAccountValidationRespFileInput>
      <tns:HeaderLine>
        <tns:LineIdentifier>H</tns:LineIdentifier>
        <tns:FileName><xsl:value-of select="&quot;AC_VALIDITY_RESP_FEED_20150603173055&quot;"/></tns:FileName>
        <tns:GenerationDate>20150603</tns:GenerationDate>
        <tns:FileReference>BF14073100007742</tns:FileReference>
      </tns:HeaderLine>
      <xsl:for-each select="/ns0:ESBMsg/ns0:RqData/ns0:Account">
        <tns:DataLine>
          <tns:LineIdentifier>D</tns:LineIdentifier>
          <tns:UnitID>
            <xsl:value-of select="com:AccountIdentifier/com:BankID"/>
          </tns:UnitID>
          <tns:AccountNo>
            <xsl:value-of select="com:AccountIdentifier/com:AccountID"/>
          </tns:AccountNo>
          <tns:Status>
            <xsl:value-of select="ns0:AccountStatus"/>
          </tns:Status>
          <tns:AccountCcy>
            <xsl:value-of select="com:AccountIdentifier/com:AccountCurrency"/>
          </tns:AccountCcy>
          <tns:Branch>
            <xsl:value-of select="com:AccountIdentifier/com:BranchID"/>
          </tns:Branch>
          <tns:AccountName>
            <xsl:value-of select="custeo:Customer/com:Person/com:PersonName/com:FullName"/>
          </tns:AccountName>
          <tns:CIFNo>
            <xsl:value-of select="custeo:Customer/com:CustomerIdentifier/com:CustomerID"/>
          </tns:CIFNo>
          <tns:AccountType>
            <xsl:value-of select="ns0:AccountType"/>
          </tns:AccountType>
          <tns:AccCategory>
            <xsl:value-of select="ns0:AccountOwnership"/>
          </tns:AccCategory>
          <tns:ProductCd>
            <xsl:value-of select="ns0:AccountSubType"/>
          </tns:ProductCd>
        </tns:DataLine>
      </xsl:for-each>
      <tns:TrailerLine>
        <tns:LineIdentifier>T</tns:LineIdentifier>
        <tns:NumberOfRows>
          <xsl:value-of select="count (/ns0:ESBMsg/ns0:RqData/ns0:Account )"/>
        </tns:NumberOfRows>
      </tns:TrailerLine>
    </tns:InternalAccountValidationRespFileInput>
  </xsl:template>
</xsl:stylesheet>

<xsl:stylesheet version="1.0"
                exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd ns0 tns oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:rs="urn:control.services.tiplus2.misys.com"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                xmlns:acceo="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:ns1="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1"
                xmlns:msg="urn:messages.service.ti.apps.tiplus2.misys.com"
                xmlns:ns0="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1"
                xmlns:ns2="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Employee/V1"
                xmlns:noteo="http://xmlns.equitybank.co.ke/ESB/EO/Misc/Notification/V1"
                xmlns:ns3="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/NationalIdentity/V1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Parties/Customer/V1/CustomerEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/RequesterServices/Misys/AppMetadata/V1/Control.xsd"/>
        <oracle-xsl-mapper:rootElement name="ServiceResponse" namespace="urn:control.services.tiplus2.misys.com"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [THU JUN 11 16:02:31 IST 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <rs:ServiceResponse>
      <rs:ResponseHeader>
        <rs:Service>Customer</rs:Service>
        <rs:Operation>CustomerDetails</rs:Operation>
        <xsl:choose>
          <xsl:when test='/eo:ESBMsg/eo:RsData/com:Status/com:Type = "Success"'>
            <rs:Status>SUCCEEDED</rs:Status>
          </xsl:when>
          <xsl:when test='/eo:ESBMsg/eo:RsData/com:Status/com:Type = "Failure"'>
            <rs:Status>FAILED</rs:Status>
          </xsl:when>
          <xsl:otherwise>
            <rs:Status>UNAVAILABLE</rs:Status>
          </xsl:otherwise>
        </xsl:choose>
        <rs:Details>
          <xsl:choose>
            <xsl:when test='/eo:ESBMsg/eo:RsData/com:Status/com:Type = "Failure"'>
              <rs:Error>ESB-100</rs:Error>
            </xsl:when>
          </xsl:choose>
          <rs:Info>
            <xsl:value-of select="/eo:ESBMsg/eo:RsData/com:Status/com:Text"/>
          </rs:Info>
        </rs:Details>
        <rs:CorrelationId>1102</rs:CorrelationId>
      </rs:ResponseHeader>
      <xsl:for-each select="/eo:ESBMsg/eo:RsData/eo:Customer">
        <msg:CustomerDetailsResponse>
          <xsl:if test="com:Person/com:PersonName/com:FullName">
            <msg:FullName>
              <xsl:value-of select="com:Person/com:PersonName/com:FullName"/>
            </msg:FullName>
          </xsl:if>
          <msg:CustomerNumber>
            <xsl:value-of select="com:CustomerIdentifier/com:CustomerID"/>
          </msg:CustomerNumber>
          <xsl:choose>
            <xsl:when test="com:Person/com:PersonName/com:MiddleName">
              <msg:ShortName>
                <xsl:value-of select="substring(com:Person/com:PersonName/com:MiddleName,1,15)"/>
              </msg:ShortName>
            </xsl:when>
            <xsl:otherwise>
              <msg:ShortName>
                <xsl:value-of select="com:Person/com:PersonName/com:FirstName"/>
              </msg:ShortName>
            </xsl:otherwise>
          </xsl:choose>
          <msg:CustomerType>AA</msg:CustomerType>
          <xsl:choose>
            <xsl:when test="acceo:Account/acceo:AccountStatus = A">
              <msg:Blocked>N</msg:Blocked>
            </xsl:when>
            <xsl:otherwise>
              <msg:Blocked>Y</msg:Blocked>
            </xsl:otherwise>
          </xsl:choose>
          <msg:Closed>N</msg:Closed>
          <msg:Deceased>N</msg:Deceased>
          <msg:Inactive>N</msg:Inactive>
          <xsl:if test="com:Phone/com:CountryCode">
            <msg:ParentCountry>
              <xsl:value-of select="com:Phone/com:CountryCode"/>
            </msg:ParentCountry>
          </xsl:if>
          <xsl:if test="com:Phone/com:CountryCode">
            <msg:ResidenceCountry>
              <xsl:value-of select="com:Phone/com:CountryCode"/>
            </msg:ResidenceCountry>
          </xsl:if>
          <msg:MailToBranch>
            <xsl:choose>
              <xsl:when test="string-length(com:CustomerIdentifier/com:BranchID)&lt; 4">
                <xsl:value-of select="concat('0',com:CustomerIdentifier/com:BranchID)"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="com:CustomerIdentifier/com:BranchID"/>
              </xsl:otherwise>
            </xsl:choose>
          </msg:MailToBranch>
          <msg:AddressDetails>
            <msg:AddressDetail>
              <msg:AddressType>P</msg:AddressType>
              <msg:AddressId>1</msg:AddressId>
              <msg:NameAndAddress>
                <xsl:value-of select="concat (com:Person/com:PersonName/com:FullName, com:Address/com:AddressType, com:Address/com:LineOne, com:Address/com:LineTwo, com:Address/com:LineThree, com:Address/com:LineFour, com:Address/com:CityName, com:Address/com:StateName, com:Address/com:CountyName, com:Address/com:CountryName, com:Address/com:PostalCode )"/>
              </msg:NameAndAddress>
              <xsl:if test="com:Address/com:PostalCode">
                <msg:ZipCode>
                  <xsl:value-of select="com:Address/com:PostalCode"/>
                </msg:ZipCode>
              </xsl:if>
              <xsl:if test="com:Phone/com:LocalNumber">
                <msg:Phone>
                  <xsl:value-of select="com:Phone/com:LocalNumber"/>
                </msg:Phone>
              </xsl:if>
              <msg:TransferMethod>00</msg:TransferMethod>
            </msg:AddressDetail>
          </msg:AddressDetails>
        </msg:CustomerDetailsResponse>
      </xsl:for-each>
    </rs:ServiceResponse>
  </xsl:template>
</xsl:stylesheet>
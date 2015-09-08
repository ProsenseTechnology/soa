<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:v13="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:v1="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Account/V1"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd v13 v1 oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:v12="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:bio="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1"
                xmlns:v14="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"
                xmlns:v11="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Common/V1"
                xmlns:fileo="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1">
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
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/RequesterServices/Polaris/Account/V1/AccountRO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Account/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [FRI JUN 19 15:20:20 EAT 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <v1:ESBMsg>
      <v11:MsgID>
        <xsl:value-of select="/v13:ESBMsg/v12:MsgID"/>
      </v11:MsgID>
      <v1:RsData>
        <v1:Account>
          <v12:BankID>
            <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Account/v12:AccountIdentifier/v12:BankID"/>
          </v12:BankID>
          <v12:AccountID>
            <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Account/v12:AccountIdentifier/v12:AccountID"/>
          </v12:AccountID>
          <v11:ClosureFlag>
            <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Account/v13:AccountClosureFlag"/>
          </v11:ClosureFlag>
          <v1:AccountOpenDate>
            <xsl:value-of select="concat(substring(/v13:ESBMsg/v13:RsData/v13:Account/v13:AccountOpenDate,1,4),substring(/v13:ESBMsg/v13:RsData/v13:Account/v13:AccountOpenDate,6,2),substring(/v13:ESBMsg/v13:RsData/v13:Account/v13:AccountOpenDate,9,2))"/>
          </v1:AccountOpenDate>
          <v12:AccountCurrency>
            <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Account/v12:AccountIdentifier/v12:AccountCurrency"/>
          </v12:AccountCurrency>
          <v1:AccountType>
            <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Account/v13:AccountType"/>
          </v1:AccountType>
          <v1:AccountStatus>
            <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Account/v13:AccountStatus"/>
          </v1:AccountStatus>
            <v1:LedgerBalance>
              <v11:Value>
                <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Account/v12:Balance[v12:BalanceType='EFFAVL']/v12:BalanceAmount"/>
              </v11:Value>
              <v11:CurrencyCode>
                <xsl:value-of select="v12:BalanceAmount/@currencyCode"/>
              </v11:CurrencyCode>
            </v1:LedgerBalance>
          
		  
          
            <v1:AvailableBalance>
              <v11:Value>
                <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Account/v12:Balance[v12:BalanceType='AVAIL']/v12:BalanceAmount"/>
              </v11:Value>
              <v11:CurrencyCode>
                <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Account/v12:Balance[v12:BalanceType='AVAIL']/v12:BalanceAmount/@currencyCode"/>
              </v11:CurrencyCode>
            </v1:AvailableBalance>
         
          
            <v1:FloatBalance>
              <v11:Value>
                <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Account/v12:Balance[v12:BalanceType='FLOAT']/v12:BalanceAmount"/>
              </v11:Value>
              <v11:CurrencyCode>
                <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Account/v12:Balance[v12:BalanceType='FLOAT']/v12:BalanceAmount/@currencyCode"/>
              </v11:CurrencyCode>
            </v1:FloatBalance>
          
          
            <v1:UnclearBalance>
              <v11:Value>
                <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Account/v12:Balance[v12:BalanceType='UNCLRBAL']/v12:BalanceAmount"/>
              </v11:Value>
              <v11:CurrencyCode>
                <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Account/v12:Balance[v12:BalanceType='UNCLRBAL']/v12:BalanceAmount/@currencyCode"/>
              </v11:CurrencyCode>
            </v1:UnclearBalance>
          
          
            <v1:OverdraftLimit>
          
              <v11:Value>
                <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Account/v12:Balance[v12:BalanceType='SANLIM']/v12:BalanceAmount"/>
              </v11:Value>
              <v11:CurrencyCode>
                <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Account/v12:Balance[v12:BalanceType='SANLIM']/v12:BalanceAmount/@currencyCode"/>
              </v11:CurrencyCode>
			  </v1:OverdraftLimit>
          
            <v1:AvailableOverdraftLimit>
              <v11:Value>
                <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Account/v12:Balance[v12:BalanceType='OVDFUT']/v12:BalanceAmount"/>
              </v11:Value>
              <v11:CurrencyCode>
                <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Account/v12:Balance[v12:BalanceType='OVDFUT']/v12:BalanceAmount/@currencyCode"/>
              </v11:CurrencyCode>
            </v1:AvailableOverdraftLimit>
            <v1:CurrentBalance>
              <v11:Value>
                <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Account/v12:Balance[v12:BalanceType='CLRBAL']/v12:BalanceAmount"/>
              </v11:Value>
              <v11:CurrencyCode>
                <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Account/v12:Balance[v12:BalanceType='CLRBAL']/v12:BalanceAmount/@currencyCode"/>
              </v11:CurrencyCode>
            </v1:CurrentBalance>
          <v12:BranchID>
            <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Account/v12:AccountIdentifier/v12:BranchID"/>
          </v12:BranchID>
          <v12:CustomerID>
            <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Account/v14:Customer/v12:CustomerIdentifier/v12:CustomerID"/>
          </v12:CustomerID>
          <v1:FullName>
            <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Account/v14:Customer/v12:Person/v12:PersonName/v12:FullName"/>
          </v1:FullName>
          <v1:AccountOwnership>
            <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Account/v13:AccountOwnership"/>
          </v1:AccountOwnership>
          <v1:AccountSubType>
            <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Account/v13:AccountSubType"/>
          </v1:AccountSubType>
        </v1:Account>
        <xsl:if test="/v13:ESBMsg/v13:RsData/v12:Status">
          <v12:Status>
            <xsl:if test="/v13:ESBMsg/v13:RsData/v12:Status/v12:Code">
              <v12:Code>
                <xsl:value-of select="/v13:ESBMsg/v13:RsData/v12:Status/v12:Code"/>
              </v12:Code>
            </xsl:if>
            <xsl:if test="/v13:ESBMsg/v13:RsData/v12:Status/v12:Type">
              <v12:Type>
                <xsl:value-of select="/v13:ESBMsg/v13:RsData/v12:Status/v12:Type"/>
              </v12:Type>
            </xsl:if>
            <xsl:if test="/v13:ESBMsg/v13:RsData/v12:Status/v12:Text">
              <v12:Text>
                <xsl:value-of select="/v13:ESBMsg/v13:RsData/v12:Status/v12:Text"/>
              </v12:Text>
            </xsl:if>
          </v12:Status>
        </xsl:if>
      </v1:RsData>
    </v1:ESBMsg>
  </xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:v13="http://xmlns.equitybank.co.ke/ESB/EO/Instruments/Card/V1"
                xmlns:v1="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Card/V1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl v13 v1 oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:v15="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"
                xmlns:v12="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:bioeo="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1"
                xmlns:v14="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"
                xmlns:v11="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Common/V1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Instruments/Card/V1/CardEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Instruments/Card/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/RequesterServices/Polaris/Card/V1/CardRO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg" namespace="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Card/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [SAT MAY 23 12:10:54 EAT 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <v1:ESBMsg>
      <v11:MsgID>
        <xsl:value-of select="/v13:ESBMsg/v12:MsgID"/>
      </v11:MsgID>
      <xsl:if test="/v13:ESBMsg/v13:RsData">
        <v1:RsData>
          <xsl:for-each select="/v13:ESBMsg/v13:RsData/v13:Card">
            <v1:Card>
              <xsl:if test="v12:CardIdentifier">
                <v12:CardIdentifier>
                  <xsl:if test="v12:CardIdentifier/v12:BankBIC">
                    <v12:BankBIC>
                      <xsl:value-of select="v12:CardIdentifier/v12:BankBIC"/>
                    </v12:BankBIC>
                  </xsl:if>
                  <xsl:if test="v12:CardIdentifier/v12:BranchID">
                    <v12:BranchID>
                      <xsl:value-of select="v12:CardIdentifier/v12:BranchID"/>
                    </v12:BranchID>
                  </xsl:if>
                  <xsl:if test="v12:CardIdentifier/v12:AccountID">
                    <v12:AccountID>
                      <xsl:value-of select="v12:CardIdentifier/v12:AccountID"/>
                    </v12:AccountID>
                  </xsl:if>
                  <xsl:if test="v12:CardIdentifier/v12:IBAN">
                    <v12:IBAN>
                      <xsl:value-of select="v12:CardIdentifier/v12:IBAN"/>
                    </v12:IBAN>
                  </xsl:if>
                  <xsl:if test="v12:CardIdentifier/v12:AccountCurrency">
                    <v12:AccountCurrency>
                      <xsl:value-of select="v12:CardIdentifier/v12:AccountCurrency"/>
                    </v12:AccountCurrency>
                  </xsl:if>
                </v12:CardIdentifier>
              </xsl:if>
              <v12:BankID>54</v12:BankID>
              <!--xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Card/v12:CardIdentifier/v12:BankID"/-->
              <xsl:if test="v12:CardIdentifier/v12:CardID">
                <v12:CardID>
                  <xsl:value-of select="v12:CardIdentifier/v12:CardID"/>
                </v12:CardID>
              </xsl:if>
              <xsl:if test="v12:CardIdentifier/v12:CardNumber">
                <v12:CardNumber>
                  <xsl:value-of select="v12:CardIdentifier/v12:CardNumber"/>
                </v12:CardNumber>
              </xsl:if>
              <xsl:if test="v14:Customer/v12:Person/v12:PersonName/v12:FullName">
                <v1:FullName>
                  <xsl:value-of select="v14:Customer/v12:Person/v12:PersonName/v12:FullName"/>
                </v1:FullName>
              </xsl:if>
              <v1:CurrentBalance>
                <v11:Value>
                  <xsl:value-of select="v14:Customer/v15:Account/v12:Balance/v12:BalanceAmount"/>
                </v11:Value>
              </v1:CurrentBalance>
              <xsl:if test="v13:UnbilledAmount">
                <v1:UnbilledAmount>
                  <xsl:value-of select="v13:UnbilledAmount"/>
                </v1:UnbilledAmount>
              </xsl:if>
              <xsl:if test="v13:LastPaymentAmount">
                <v1:LastPaymentAmount>
                  <xsl:value-of select="v13:LastPaymentAmount"/>
                </v1:LastPaymentAmount>
              </xsl:if>
              <xsl:if test="v13:CreditLimit">
                <v1:TotalCreditLimit>
                  <xsl:value-of select="v13:CreditLimit"/>
                </v1:TotalCreditLimit>
              </xsl:if>
              <xsl:if test="v13:AvailableCredit">
                <v1:AvailableCreditLimit>
                  <xsl:value-of select="v13:AvailableCredit"/>
                </v1:AvailableCreditLimit>
              </xsl:if>
              <xsl:if test="v13:AvailableCash">
                <v1:AvailableCashLimit>
                  <xsl:value-of select="v13:AvailableCash"/>
                </v1:AvailableCashLimit>
              </xsl:if>
              <xsl:if test="v13:CashLimit">
                <v1:CashLimit>
                  <xsl:value-of select="v13:CashLimit"/>
                </v1:CashLimit>
              </xsl:if>
              <xsl:if test="v13:TotalPaymentDue">
                <v1:TotalPaymentDue>
                  <xsl:value-of select="v13:TotalPaymentDue"/>
                </v1:TotalPaymentDue>
              </xsl:if>
              <xsl:if test="v13:MinPaymentDue">
                <v1:MinPaymentDue>
                  <xsl:value-of select="v13:MinPaymentDue"/>
                </v1:MinPaymentDue>
              </xsl:if>
              <xsl:if test="v13:PastDueAmount">
                <v1:PastDueAmount>
                  <xsl:value-of select="v13:PastDueAmount"/>
                </v1:PastDueAmount>
              </xsl:if>
              <xsl:if test="v13:PaymentDueDate">
                <v1:PaymentDueDate>
                  <xsl:value-of select="substring (translate(v13:PaymentDueDate,'-',''), 1,8)"/>
                </v1:PaymentDueDate>
              </xsl:if>
              <xsl:if test="v13:AutoRecoveryOption">
                <v1:AutoRecoveryOption>
                  <xsl:value-of select="v13:AutoRecoveryOption"/>
                </v1:AutoRecoveryOption>
              </xsl:if>
              <xsl:if test="v13:RecoveryAccount">
                <v1:RecoveryAccount>
                  <xsl:value-of select="v13:RecoveryAccount"/>
                </v1:RecoveryAccount>
              </xsl:if>
              <xsl:if test="v13:LastBillingDate">
                <v1:LastBillingDate>
                  <xsl:value-of select="concat (substring (v13:LastBillingDate, 1, 4 ), substring (v13:LastBillingDate, 6, 2 ), substring (v13:LastBillingDate, 9, 2 ) )"/>
                </v1:LastBillingDate>
              </xsl:if>
              <xsl:if test="v13:CardType">
                <v1:CardType>
                  <xsl:value-of select="v13:CardType"/>
                </v1:CardType>
              </xsl:if>
              <xsl:if test="v13:CardSubType">
                <v13:CardSubType>
                  <xsl:value-of select="v13:CardSubType"/>
                </v13:CardSubType>
              </xsl:if>
              <xsl:if test="v13:CardStatus">
                <v1:CardStatus>
                  <xsl:value-of select="v13:CardStatus"/>
                </v1:CardStatus>
              </xsl:if>
              <xsl:if test="v13:CardOpenDate">
                <v13:CardOpenDate>
                  <xsl:value-of select="v13:CardOpenDate"/>
                </v13:CardOpenDate>
              </xsl:if>
              <xsl:if test="v13:CardExpiryDate">
                <v13:CardExpiryDate>
                  <xsl:value-of select="v13:CardExpiryDate"/>
                </v13:CardExpiryDate>
              </xsl:if>
              <xsl:if test="v13:CardOwnership">
                <v13:CardOwnership>
                  <xsl:value-of select="v13:CardOwnership"/>
                </v13:CardOwnership>
              </xsl:if>
              <xsl:if test="v13:TotalAmountDue">
                <v1:TotalAmountDue>
                  <xsl:value-of select="v13:TotalAmountDue"/>
                </v1:TotalAmountDue>
              </xsl:if>
              <xsl:if test="v14:Customer/v12:Person/v12:PersonName/v12:FullName">
                <v1:CardHolderName>
                  <xsl:value-of select="v14:Customer/v12:Person/v12:PersonName/v12:FullName"/>
                </v1:CardHolderName>
              </xsl:if>
              <xsl:if test="v14:Customer/v15:Account">
                <v1:CardAccountNumber>
                  <xsl:value-of select="v14:Customer/v15:Account/v12:AccountIdentifier/v12:AccountID"/>
                </v1:CardAccountNumber>
              </xsl:if>
              <xsl:if test="v14:Customer/v12:CustomerIdentifier/v12:CustomerID">
                <v12:CustomerID>
                  <xsl:value-of select="v14:Customer/v12:CustomerIdentifier/v12:CustomerID"/>
                </v12:CustomerID>
              </xsl:if>
              <xsl:if test="v14:Customer">
                <v12:CustomerIdentifier>
                  <xsl:if test="v14:Customer/v14:PostingBranchID">
                    <v12:BranchID>
                      <xsl:value-of select="v14:Customer/v14:PostingBranchID"/>
                    </v12:BranchID>
                  </xsl:if>
                </v12:CustomerIdentifier>
              </xsl:if>
              <xsl:if test="v13:CardIssuer">
                <v1:CardIssuer>
                  <xsl:value-of select="v13:CardIssuer"/>
                </v1:CardIssuer>
              </xsl:if>
              <xsl:if test="v13:CardReissueFlag">
                <v1:CardReissueFlag>
                  <xsl:value-of select="v13:CardReissueFlag"/>
                </v1:CardReissueFlag>
              </xsl:if>
              <xsl:if test="v13:NextStatementDate">
                <v1:NextStatementDate>
                  <xsl:value-of select="concat (substring (v13:NextStatementDate, 1, 4 ), substring (v13:NextStatementDate, 6, 2 ), substring (v13:NextStatementDate, 9, 2 ) )"/>
                </v1:NextStatementDate>
              </xsl:if>
            </v1:Card>
          </xsl:for-each>
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
      </xsl:if>
    </v1:ESBMsg>
  </xsl:template>
</xsl:stylesheet>

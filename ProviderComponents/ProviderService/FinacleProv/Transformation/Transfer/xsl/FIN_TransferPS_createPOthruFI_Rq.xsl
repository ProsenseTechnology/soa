<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:app="http://www.finacle.com/fixml" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Transfer/V1"
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
                xmlns:fileo="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1">
  <oracle-xsl-mapper:schema>
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Transactions/Transfer/V1/TransferEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Transfer/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/ProviderServices/Finacle/AppMetadata/xsds/FIXML.xsd"/>
        <oracle-xsl-mapper:rootElement name="FIXML" namespace="http://www.finacle.com/fixml"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
  </oracle-xsl-mapper:schema>
  <xsl:template match="/">
    <app:FIXML xmlns="http://www.finacle.com/fixml">
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
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Transfer/com:TransferIdentifier/com:BankID"/>
            </app:BankId>
            <app:TimeZone/>
            <app:EntityId/>
            <app:EntityType/>
            <app:ArmCorrelationId/>
            <app:MessageDateTime>
              <xsl:value-of select="xp20:format-dateTime(xp20:current-dateTime(),'[Y0001]-[M01]-[D01]T[H01]:[M01]:[s01].[s001]')"/>
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
            <app:requestId>createPOthruFI.scr</app:requestId>
          </app:ExecuteFinacleScriptInputVO>
          <app:executeFinacleScript_CustomData>
            <app:AutoVerify>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Transfer/eo:AutoVerify"/>
            </app:AutoVerify>
            <app:POType>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Transfer/eo:POType"/>
            </app:POType>
            <app:purposeCode>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Transfer/eo:PurposeCode"/>
            </app:purposeCode>
            <app:ChrgEventId>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Transfer/eo:ChargeEventID"/>
            </app:ChrgEventId>
            <app:DrValueDate>
              <xsl:value-of select="xp20:format-dateTime(/eo:ESBMsg/eo:RqData/eo:Transfer/com:ValueDate,'[D01]-[M01]-[Y0001]')"/>
            </app:DrValueDate>
            <app:TranRefNum>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Transfer/com:TransactionReferenceNumber"/>
            </app:TranRefNum>
            <app:DrExecutionDate>
              <xsl:value-of select="xp20:format-dateTime(/eo:ESBMsg/eo:RqData/eo:Transfer/eo:DebitExecutionDate,'[D01]-[M01]-[Y0001]')"/>
            </app:DrExecutionDate>
            <app:SenderBIC></app:SenderBIC>
            <app:DrAcct>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Transfer/com:PayFromAccount/com:AccountIdentifier/com:AccountID"/>
            </app:DrAcct>
            <app:CrAcct>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Transfer/com:PayeeAccount/com:AccountIdentifier/com:AccountID"/>
            </app:CrAcct>
            <app:ChrgDrAcct></app:ChrgDrAcct>
            <app:RemitAmt>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Transfer/com:Amount"/>
            </app:RemitAmt>
            <app:RemitCrncyCode>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Transfer/com:Amount/@currencyCode"/>
            </app:RemitCrncyCode>
            <app:InstructedAmt>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Transfer/eo:InstructedAmount"/>
            </app:InstructedAmt>
            <app:InstructedAmtCrncy>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Transfer/eo:InstructedAmount/@currencyCode"/>
            </app:InstructedAmtCrncy>
            <app:ChargeOption>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Transfer/eo:ChargeOption"/>
            </app:ChargeOption>
            <app:CrValueDate>
              <xsl:value-of select="xp20:format-dateTime(/eo:ESBMsg/eo:RqData/eo:Transfer/eo:CreditValueDate,'[D01]-[M01]-[Y0001]')"/>
            </app:CrValueDate>
            <app:ReqExecDate>
              <xsl:value-of select="xp20:format-dateTime(/eo:ESBMsg/eo:RqData/eo:Transfer/eo:RequestExecutionDate,'[D01]-[M01]-[Y0001]')"/>
            </app:ReqExecDate>
            <app:CrExecutionDate>
              <xsl:value-of select="xp20:format-dateTime(/eo:ESBMsg/eo:RqData/eo:Transfer/eo:CreditExecutionDate,'[D01]-[M01]-[Y0001]')"/>
            </app:CrExecutionDate>
            <app:BenefPartyBIC></app:BenefPartyBIC>
            <app:AwiAddrInd>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Transfer/eo:AWIAddressIndicator"/>
            </app:AwiAddrInd>
            <app:AwiAcct>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Transfer/com:PayeeAccount/com:AccountIdentifier/com:AccountID"/>
            </app:AwiAcct>
            <app:AwiName>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Transfer/com:PayeeAccount/com:PartyReference/com:PersonName/com:FullName"/>
            </app:AwiName>
            <app:AwiBIC>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Transfer/com:PayeeAccount/com:AccountIdentifier/com:BankBIC"/>
            </app:AwiBIC>
            <app:AwiBankCode>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Transfer/com:PayeeAccount/com:AccountIdentifier/com:BankID"/>
            </app:AwiBankCode>
            <app:AwiBrCode>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Transfer/com:PayeeAccount/com:AccountIdentifier/com:BranchID"/>
            </app:AwiBrCode>
            <app:OurCorrespBIC>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Transfer/eo:IntermediaryAccount/com:AccountIdentifier/com:BankBIC"/>
            </app:OurCorrespBIC>
            <app:OurCorrespBankCode>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Transfer/eo:IntermediaryAccount/com:AccountIdentifier/com:BankID"/>
            </app:OurCorrespBankCode>
            <app:OurCorrespBrCode>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Transfer/eo:IntermediaryAccount/com:AccountIdentifier/com:BranchID"/>
            </app:OurCorrespBrCode>
            <app:RemitInfo>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Transfer/eo:RemitInfo"/>
            </app:RemitInfo>
            <app:SenderToRecvrInfo/>
            <app:OrderType>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Transfer/eo:TransferOrderType"/>
            </app:OrderType>
            <app:CountryCode>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Transfer/com:CountryCode"/>
            </app:CountryCode>
            <app:BenefPartyAcct>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Transfer/com:PayeeAccount/com:AccountIdentifier/com:AccountID"/>
            </app:BenefPartyAcct>
            <app:BenefPartyName>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Transfer/com:PayeeAccount/com:PartyReference/com:PersonName/com:FullName"/>
            </app:BenefPartyName>
            <app:BenefPartyAddr3/>
            <app:BenefPartyAddr1>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Transfer/com:PayeeAccount/com:PartyReference/com:Address/com:LineOne"/>
            </app:BenefPartyAddr1>
            <app:BenefPartyAddr2>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Transfer/com:PayeeAccount/com:PartyReference/com:Address/com:LineTwo"/>
            </app:BenefPartyAddr2>
            <app:BenefPartyAddr3>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Transfer/com:PayeeAccount/com:PartyReference/com:Address/com:LineThree"/>
            </app:BenefPartyAddr3>
            <app:WaiveCharges>
              <xsl:choose>
                <xsl:when test="/eo:ESBMsg/eo:RqData/eo:Transfer/eo:WaiveChargesIndicator='true'">Y</xsl:when>
                <xsl:otherwise>N</xsl:otherwise>
              </xsl:choose>
            </app:WaiveCharges>
            <app:tag36Rate>TTS</app:tag36Rate>
            <app:SenderChrgAmt/>
            <app:SenderChrgCrncy/>
            <app:RecvrChrgCrncy/>
            <app:RecvrChrgAmt/>
            <app:SenderChrgCrncy/>
            <app:ordPartyAcct></app:ordPartyAcct>
            <app:ordPartyName>EDREM</app:ordPartyName>
            <app:ordPartyAdd1>EDREM</app:ordPartyAdd1>
            <app:ordPartyAdd2>EDREM</app:ordPartyAdd2>
            <app:AwiAddr1/>
            <app:AwiAddr2/>
            <app:AwiAddr3/>
            <app:exchRateCode>TTS</app:exchRateCode>
            <app:chrgExchRateCode/>
            <app:interInstnBic/>
            <app:interInstnBrCode/>
            <app:interInstnBankCode/>
            <app:interInstnName/>
            <app:interInstnNameAddr1/>
            <app:interInstnNameAddr2/>
            <app:interInstnNameAddr3/>
            <app:ExchRate>
              <xsl:value-of select="/eo:ESBMsg/eo:RqData/eo:Transfer/com:Rate"/>
            </app:ExchRate>
          </app:executeFinacleScript_CustomData>
        </app:executeFinacleScriptRequest>
      </app:Body>
    </app:FIXML>
  </xsl:template>
</xsl:stylesheet>
//
//  UserInformationViewController.swift
//  BLProJect
//
//  Created by Kim dohyun on 2020/12/29.
//  Copyright © 2020 김도현. All rights reserved.
//

import UIKit
import SnapKit


class UserInformationViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    @IBOutlet weak var userInformationtitle: UILabel!
    @IBOutlet weak var userInformationsubtitle: UILabel!
    @IBOutlet weak var userInformationgendertitle: UILabel!
    @IBOutlet weak var userInformationbirthday: UILabel!
    @IBOutlet weak var userInformationbirthdayButton: UIButton!
    @IBOutlet weak var userInformationareatitle: UILabel!
    @IBOutlet weak var userInformationareaAddbtn: UIButton!
    @IBOutlet weak var userInformationIntresttitle: UILabel!
    @IBOutlet weak var userInformationConfirmButton: UIButton!
    @IBOutlet weak var userInformationmanButton: UIButton!
    @IBOutlet weak var userInformationmanTitleLabel: UILabel!
    @IBOutlet weak var userInformationgirlButton: UIButton!
    @IBOutlet weak var userInformationgirlTitleLabel: UILabel!
    @IBOutlet weak var userInformationAreaSelectionButton: UIButton!
    @IBOutlet weak var userInformationAreaSelectionButtonTwo: UIButton!
    @IBOutlet var birthdayView: BirthDayView!
    @IBOutlet weak var userInformationInterestingStudyButton: UIButton!
    @IBOutlet weak var userInformationAreaLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var userInfomationAreaSelectionTwoLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var userInfomationAreaSelectionWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var userInfomationAreaSelectionTwoWidthConstraint: NSLayoutConstraint!
    public let birthDayTitle = ["1980","1981","1982","1983","1984","1985","1986",
                                "1987","1988","1989","1990","1991","1992","1993",
                                "1994","1995","1996","1997","1998","1999","2000",
                                "2001","2002","2003","2004","2005","2006","2007",
                                "2008","2009","2010","2011","2012","2013","2014",
                                "2015","2016","2017","2018","2019","2020","2021"]
    
    lazy var BirthDayContainerView: UIView = {
        let ConatinerView = UIView(frame: self.view.frame)
        ConatinerView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        ConatinerView.tag = 1
        return ConatinerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initLayout()
        self.showAreaselectionButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.showAreaselectionButton()
        
    }

    public func initLayout() {
        self.userInformationtitle.textColor = UIColor(red: 61/255, green: 61/255, blue: 61/255, alpha: 1.0)
        self.userInformationtitle.numberOfLines = 1
        self.userInformationtitle.textAlignment = .left
        self.userInformationtitle.attributedText = NSAttributedString(string: "어떤 스터디를 찾고 있나요?", attributes: [NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Bold", size: 26)])
        self.userInformationsubtitle.textColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0)
        self.userInformationsubtitle.numberOfLines = 2
        self.userInformationsubtitle.textAlignment = .left
        self.userInformationsubtitle.attributedText = NSAttributedString(string: "입력하신 정보로 스터디를 찾을 수 있습니다.\n지역 정보는 다른 사람들에게 공유되지 않습니다.", attributes: [NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Medium", size: 14)])
        self.userInformationgendertitle.numberOfLines = 1
        self.userInformationgendertitle.textColor = UIColor(red: 61/255, green: 61/255, blue: 61/255, alpha: 1.0)
        self.userInformationgendertitle.textAlignment = .left
        self.userInformationgendertitle.attributedText = NSAttributedString(string: "성별", attributes: [NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Medium", size: 14)])
        self.userInformationmanButton.setImage(UIImage(named: "GrayCheck.png"), for: .normal)
        self.userInformationmanButton.addTarget(self, action: #selector(didTapMangender(_:)), for: .touchUpInside)
        self.userInformationmanTitleLabel.attributedText = NSAttributedString(string: "남자", attributes: [NSAttributedString.Key.kern: -0.77])
        self.userInformationmanTitleLabel.textColor = UIColor(red: 165/255, green: 165/255, blue: 165/255, alpha: 1.0)
        self.userInformationmanTitleLabel.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 14)
        self.userInformationmanTitleLabel.textAlignment = .left
        self.userInformationgirlButton.setImage(UIImage(named: "GrayCheck.png"), for: .normal)
        self.userInformationgirlButton.addTarget(self, action: #selector(didTapGirlgender(_:)), for: .touchUpInside)
        self.userInformationgirlTitleLabel.attributedText = NSAttributedString(string: "여자", attributes: [NSAttributedString.Key.kern: -0.77])
        self.userInformationgirlTitleLabel.textColor = UIColor(red: 165/255, green: 165/255, blue: 165/255, alpha: 1.0)
        self.userInformationgirlTitleLabel.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 14)
        self.userInformationgirlTitleLabel.textAlignment = .left
        self.userInformationbirthday.text = "출생년도"
        self.userInformationbirthday.textColor = UIColor(red: 61/255, green: 61/255, blue: 61/255, alpha: 1.0)
        self.userInformationbirthday.textAlignment = .center
        self.userInformationbirthday.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 14)
        self.userInformationbirthdayButton.layer.borderWidth = 1
        self.userInformationbirthdayButton.layer.borderColor = UIColor(red: 223/255, green: 223/255, blue: 223/255, alpha: 1.0).cgColor
        self.userInformationbirthdayButton.setTitle("1996", for: .normal)
        self.userInformationbirthdayButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 16)
        self.userInformationbirthdayButton.setTitleColor(UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0), for: .normal)
        self.userInformationbirthdayButton.layer.cornerRadius = 4
        self.userInformationbirthdayButton.layer.masksToBounds = true
        self.userInformationbirthdayButton.contentHorizontalAlignment = .left
        self.userInformationbirthdayButton.setImage(UIImage(named: "triangle.png"), for: .normal)
        self.userInformationbirthdayButton.setTitleColor(UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0), for: .normal)
        self.userInformationbirthdayButton.tintColor = UIColor(red: 196/266, green: 196/255, blue: 196/255, alpha: 1.0)
        self.userInformationbirthdayButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 140, bottom: 0, right: 0)
        self.userInformationbirthdayButton.addTarget(self, action: #selector(didTapShowBirthDayView(_:)), for: .touchUpInside)
        self.userInformationareatitle.text = "지역"
        self.userInformationareatitle.textColor = UIColor(red: 61/255, green: 61/255, blue: 61/255, alpha: 1.0)
        self.userInformationareatitle.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 14)
        self.userInformationareatitle.textAlignment = .left
        self.userInformationareaAddbtn.setAttributedTitle(NSAttributedString(string: "추가하기", attributes: [NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Medium", size: 12)]), for: .normal)
        self.userInformationareaAddbtn.setImage(UIImage(named: "addCircle.png"), for: .normal)
        self.userInformationareaAddbtn.contentHorizontalAlignment = .right
        self.userInformationareaAddbtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 40)
        self.userInformationareaAddbtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 36)
        self.userInformationareaAddbtn.setTitleColor(UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0), for: .normal)
        self.userInformationareaAddbtn.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1.0)
        self.userInformationareaAddbtn.layer.cornerRadius = 4
        self.userInformationareaAddbtn.layer.masksToBounds = true
        self.userInformationareaAddbtn.addTarget(self, action: #selector(didTapAreaSearchView), for: .touchUpInside)
        self.userInformationAreaSelectionButton.setTitleColor(UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0), for: .normal)
        self.userInformationAreaSelectionButton.setAttributedTitle(NSAttributedString(string: "", attributes: [NSAttributedString.Key.kern: -0.77,NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Medium", size: 14)]), for: .normal)
        self.userInformationAreaSelectionButton.setImage(UIImage(named: "Delete.png"), for: .normal)
        self.userInformationAreaSelectionButton.contentHorizontalAlignment = .right
        self.userInformationAreaSelectionButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 109, bottom: 0, right: 0)
        self.userInformationAreaSelectionButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 40)
        self.userInformationAreaSelectionButton.layer.cornerRadius = 4
        self.userInformationAreaSelectionButton.layer.masksToBounds = true
        self.userInformationAreaSelectionButton.isHidden = true
        self.userInformationAreaSelectionButtonTwo.setTitleColor(UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0), for: .normal)
        self.userInformationAreaSelectionButtonTwo.setAttributedTitle(NSAttributedString(string: "", attributes: [NSAttributedString.Key.kern: -0.77,NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Medium", size: 14)]), for: .normal)
        self.userInformationAreaSelectionButtonTwo.setImage(UIImage(named: "Delete.png"), for: .normal)
        self.userInformationAreaSelectionButtonTwo.contentHorizontalAlignment = .right
        self.userInformationAreaSelectionButtonTwo.imageEdgeInsets = UIEdgeInsets(top: 0, left: 109, bottom: 0, right: 0)
        self.userInformationAreaSelectionButtonTwo.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 40)
        self.userInformationAreaSelectionButtonTwo.layer.cornerRadius = 4
        self.userInformationAreaSelectionButtonTwo.layer.masksToBounds = true
        self.userInformationAreaSelectionButtonTwo.isHidden = true
        self.userInformationIntresttitle.textAlignment = .left
        self.userInformationIntresttitle.textColor = UIColor(red: 61/255, green: 61/255, blue: 61/255, alpha: 1.0)
        self.userInformationIntresttitle.attributedText = NSAttributedString(string: "관심 스터디", attributes: [NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Medium", size: 14)])
        self.userInformationConfirmButton.backgroundColor = UIColor(red: 255/255, green: 118/255, blue: 99/255, alpha: 1.0)
        self.userInformationConfirmButton.setAttributedTitle(NSAttributedString(string: "가입하기", attributes: [NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Bold", size: 16)]), for: .normal)
        self.userInformationConfirmButton.setTitleColor(UIColor.white, for: .normal)
        self.userInformationConfirmButton.layer.cornerRadius = 4
        self.userInformationConfirmButton.layer.masksToBounds = true
        self.userInformationInterestingStudyButton.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1.0)
        self.userInformationInterestingStudyButton.setAttributedTitle(NSAttributedString(string: "추가하기", attributes: [NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Medium", size: 12)]), for: .normal)
        self.userInformationInterestingStudyButton.setTitleColor(UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0), for: .normal)
        self.userInformationInterestingStudyButton.layer.cornerRadius = 4
        self.userInformationInterestingStudyButton.layer.masksToBounds = true
        self.userInformationInterestingStudyButton.setImage(UIImage(named: "addCircle.png"), for: .normal)
        self.userInformationInterestingStudyButton.contentHorizontalAlignment = .right
        self.userInformationInterestingStudyButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 140)
        self.userInformationInterestingStudyButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 136)
        self.userInformationAreaSelectionButton.addTarget(self, action: #selector(self.didTapAreaInfoDelete(_:)), for: .touchUpInside)
        self.userInformationAreaSelectionButtonTwo.addTarget(self, action: #selector(self.didTapAreaInfoTwoDelete(_:)), for: .touchUpInside)
        self.userInformationInterestingStudyButton.addTarget(self, action: #selector(self.didTapShowInterestView), for: .touchUpInside)
    }
    
    private func birthDayViewInit() {
        let screenSize = UIScreen.main.bounds.size
        self.birthdayView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: screenSize.height / 2)
        self.birthdayView.birthDayTitleLabel.text = "출생 년도"
        self.birthdayView.birthDayTitleLabel.textColor = UIColor(red: 54/255, green: 54/255, blue: 54/255, alpha: 1.0)
        self.birthdayView.birthDayTitleLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        self.birthdayView.birthDayTitleLabel.textAlignment = .left
        self.birthdayView.birthDayPickerView.delegate = self
        self.birthdayView.birthDayPickerView.dataSource = self
        self.birthdayView.birthDayConfirmButton.setAttributedTitle(NSAttributedString(string: "확인", attributes: [NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Bold", size: 16)]), for: .normal)
        self.birthdayView.birthDayConfirmButton.setTitleColor(UIColor.white, for: .normal)
        self.birthdayView.birthDayConfirmButton.layer.cornerRadius = 8
        self.birthdayView.birthDayConfirmButton.layer.masksToBounds = true
        self.birthdayView.birthDayConfirmButton.backgroundColor = UIColor(red: 255/255, green: 118/255, blue: 99/255, alpha: 1.0)
        self.birthdayView.birthDayConfirmButton.addTarget(self, action: #selector(didRemoveBirthDayView(_:)), for: .touchUpInside)
        self.birthdayView.layer.cornerRadius = 8
        self.birthdayView.layer.masksToBounds = true
        self.birthdayView.backgroundColor = UIColor.white
    }
    
    public func showAreaselectionButton() {
        if UserDefaults.standard.string(forKey: "first_name") != nil && UserDefaults.standard.string(forKey: "first_longname") != nil {
            if UserDefaults.standard.string(forKey: "first_longname")?.count == 4 {
                self.userInformationAreaSelectionButton.layoutIfNeeded()
                self.userInfomationAreaSelectionWidthConstraint.constant = 150
                self.userInformationAreaSelectionButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 119, bottom: 0, right: 0)
            } else {
                self.userInformationAreaSelectionButton.layoutIfNeeded()
                self.userInfomationAreaSelectionWidthConstraint.constant = 133
                self.userInformationAreaSelectionButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 109, bottom: 0, right: 0)
            }
            self.userInformationareaAddbtn.layoutIfNeeded()
            self.userInformationAreaLeadingConstraint.constant = 163
            self.userInformationAreaSelectionButton.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1.0)
            self.userInformationAreaSelectionButton.setTitle("\(UserDefaults.standard.string(forKey: "first_name")!) \(UserDefaults.standard.string(forKey: "first_longname")!)", for: .normal)
            self.userInformationAreaSelectionButton.isHidden = false
        }
        if UserDefaults.standard.string(forKey: "second_name") != nil && UserDefaults.standard.string(forKey: "second_longname") != nil {
            if UserDefaults.standard.string(forKey: "second_longname")?.count == 4 {
                self.userInformationAreaSelectionButtonTwo.layoutIfNeeded()
                self.userInfomationAreaSelectionTwoWidthConstraint.constant = 150
                self.userInfomationAreaSelectionTwoLeadingConstraint.constant = -110
                self.userInformationAreaSelectionButtonTwo.imageEdgeInsets = UIEdgeInsets(top: 0, left: 119, bottom: 0, right: 0)
            } else {
                self.userInformationAreaSelectionButtonTwo.layoutIfNeeded()
                self.userInfomationAreaSelectionTwoWidthConstraint.constant = 133
                self.userInfomationAreaSelectionTwoLeadingConstraint.constant = -110
                self.userInformationAreaSelectionButtonTwo.imageEdgeInsets = UIEdgeInsets(top: 0, left: 109, bottom: 0, right: 0)
            }
            if UserDefaults.standard.string(forKey: "second_longname")?.count == 4 && UserDefaults.standard.string(forKey: "first_longname")?.count == 3  || UserDefaults.standard.string(forKey: "second_longname")?.count == 3 && UserDefaults.standard.string(forKey: "first_longname")?.count == 3 {
                self.userInfomationAreaSelectionTwoLeadingConstraint.constant = -130
            }
            self.userInformationAreaSelectionButtonTwo.isHidden = false
            self.userInformationareaAddbtn.isHidden = true
            self.userInformationAreaSelectionButtonTwo.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1.0)
            self.userInformationAreaSelectionButtonTwo.setTitle("\(UserDefaults.standard.string(forKey: "second_name")!) \(UserDefaults.standard.string(forKey: "second_longname")!)", for: .normal)
            self.userInformationAreaSelectionButtonTwo.isHidden = false
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.birthDayTitle.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.birthDayTitle[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.userInformationbirthdayButton.setTitle(self.birthDayTitle[row], for: .normal)
    }
    
    
    @objc
    private func didTapAreaInfoDelete(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "first_longname")
        UserDefaults.standard.removeObject(forKey: "first_name")
        self.userInformationAreaSelectionButton.isHidden = true
        self.userInformationareaAddbtn.isHidden = false
        if self.userInformationAreaSelectionButton.isHidden == true && self.userInformationAreaSelectionButtonTwo.isHidden == true {
            self.userInformationAreaLeadingConstraint.constant = 20
        } else if self.userInformationAreaSelectionButtonTwo.isHidden == false && self.userInformationareaAddbtn.isHidden == false {
            self.userInfomationAreaSelectionTwoLeadingConstraint.constant = -280
            if UserDefaults.standard.string(forKey: "second_longname")?.count == 4 {
                self.userInformationAreaLeadingConstraint.constant = 180
                self.userInfomationAreaSelectionTwoLeadingConstraint.constant = -300
            } else {
                self.userInformationAreaLeadingConstraint.constant = 163
            }
        }
    }
    
    @objc
    private func didTapAreaInfoTwoDelete(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "second_longname")
        UserDefaults.standard.removeObject(forKey: "second_name")
        self.userInformationAreaSelectionButtonTwo.isHidden = true
        self.userInformationareaAddbtn.isHidden = false
        if self.userInformationAreaSelectionButton.isHidden == false {
            self.userInformationAreaLeadingConstraint.constant = 163
        }
        if userInformationAreaSelectionButtonTwo.isHidden == true && self.userInformationAreaSelectionButton.isHidden == true {
            self.userInformationAreaLeadingConstraint.constant = 20
        } else if self.userInformationAreaSelectionButtonTwo.isHidden == true && self.userInformationAreaSelectionButton.isHidden == false {
            self.userInformationAreaLeadingConstraint.constant = 163
        }
    }
    
    @objc
    private func didTapShowInterestView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let interestView = storyboard.instantiateViewController(withIdentifier: "InterestView") as? InterestFieldViewController
        guard let interestVC = interestView else {return}
        self.navigationController?.pushViewController(interestVC, animated: true)
    }
    
    
    
    @objc
    private func didTapMangender(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            self.userInformationgirlButton.isSelected = false
            self.userInformationmanTitleLabel.textColor = UIColor(red: 165/255, green: 165/255, blue: 165/255, alpha: 1.0)
        } else {
            sender.isSelected = true
            self.userInformationgirlButton.isSelected = false
            self.userInformationmanButton.setImage(UIImage(named: "RedCheck.png"), for: .selected)
            self.userInformationmanTitleLabel.textColor = UIColor(red: 255/255, green: 118/255, blue: 99/255, alpha: 1.0)
            self.userInformationgirlTitleLabel.textColor = UIColor(red: 165/255, green: 165/255, blue: 165/255, alpha: 1.0)
        }
    }
    
    @objc
    private func didTapGirlgender(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            self.userInformationgirlButton.isSelected = false
            self.userInformationgirlTitleLabel.textColor = UIColor(red: 165/255, green: 165/255, blue: 165/255, alpha: 1.0)
        } else {
            sender.isSelected = true
            self.userInformationmanButton.isSelected = false
            self.userInformationgirlButton.setImage(UIImage(named: "RedCheck.png"), for: .selected)
            self.userInformationgirlTitleLabel.textColor = UIColor(red: 255/255, green: 118/255, blue: 99/255, alpha: 1.0)
            self.userInformationmanTitleLabel.textColor = UIColor(red: 165/255, green: 165/255, blue: 165/255, alpha: 1.0)
        }
    }
    
    @objc
    private func didTapShowBirthDayView(_ sender: UIButton) {
        let window = UIApplication.shared.windows.first
        let screenSize = UIScreen.main.bounds.size
        self.birthDayViewInit()
        window?.addSubview(self.BirthDayContainerView)
        window?.addSubview(self.birthdayView)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.BirthDayContainerView.alpha = 0.5
            self.birthdayView.frame = CGRect(x: 0, y: screenSize.height - screenSize.height / 1.9, width: screenSize.width, height: screenSize.height + self.view.safeAreaInsets.bottom)
        })
        
    }
    
    @objc
    private func didRemoveBirthDayView(_ sender: UIButton) {
        let screenSize = UIScreen.main.bounds.size
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.BirthDayContainerView.alpha = 0
            self.birthdayView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: screenSize.height / 1.9)
        })
    }
    
    @objc
    private func didTapAreaSearchView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let AreaSearchView = storyboard.instantiateViewController(withIdentifier: "AreaSearchView") as? AreaSearchViewController
        guard let AreaSearchVC = AreaSearchView else { return }
        self.navigationController?.pushViewController(AreaSearchVC, animated: true)
    }
    
}

class BirthDayView: UIView {
    
    @IBOutlet weak var birthDayTitleLabel: UILabel!
    @IBOutlet weak var birthDayPickerView: UIPickerView!
    @IBOutlet weak var birthDayConfirmButton: UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
